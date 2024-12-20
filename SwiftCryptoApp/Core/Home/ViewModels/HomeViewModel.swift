////
//  HomeViewModel.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/17/23.
//  
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var  statistics: [Statistic] = []
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers() {
       
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins) // Subscribing to the allCoins publisher by adding "$"
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates MarketData
        marketDataService.$marketData //Subscribing to the marketData publisher by adding "$"
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
        // updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)   //Subscribing to allCoins and savedEntities
            .map { (coinModels, portfolioEntities) -> [Coin] in    //coinModels from $allCoins and portfolioEntities from $savedEntities
                coinModels
                    .compactMap { (coin) -> Coin? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id}) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] (returnedCoins) in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    func updatePortfolio(coin: Coin, amount: Double) {
        portfolioDataService.updateportfolio(coin: coin, amount: amount)
    }
    
    func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercaseText = text.lowercased()
        return coins.filter { (coin) in
            return coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText) ||
            coin.id.lowercased().contains(lowercaseText)
        }
    }
    
    private func mapGlobalMarketData(marketData: MarketData?) -> [Statistic] {
        var stats: [Statistic] = []
        
        guard let data = marketData else {
            return stats
        }
        let marketcap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistic(title: "24h Volume", value: data.volume)
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = Statistic(title: "Portfolio Value", value: "0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketcap,
            volume,
            btcDominance,
            portfolio])
        return stats
    }
}
