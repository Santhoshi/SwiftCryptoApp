////
//  CoinDataService.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/17/23.
//  
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [Coin] = []
    
    var coinSubscriptions: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        
        guard let url = URL (string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
         
        //guard let url = URL (string: "dumy") else { return }
        
        coinSubscriptions = NetworkingManager.downloadData(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscriptions?.cancel()
            })
        
    }
}
