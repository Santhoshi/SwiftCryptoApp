////
//  CoinImageService.swift
//  SwiftCryptoApp
//
//  Created by Santhoshi Guduru on 8/17/23.
//  
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: Coin){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName:folderName ) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    private func downloadCoinImage() {
        guard let url = URL (string: coin.image)else { return }
        
        imageSubscription = NetworkingManager.downloadData(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                guard let self = self,
                      let downloadedImage = returnedImage
                else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
