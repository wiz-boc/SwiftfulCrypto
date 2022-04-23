//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/23/22.
//

import Foundation
import Combine


class MarketDataService {
    @Published var marketData: MarketDataModel?
    var marketDataSubscription: AnyCancellable?
    init(){
        getData()
    }
    
    private func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                guard let self = self else { return }
                self.marketData = returnedGlobalData.data
                self.marketDataSubscription?.cancel()
            })
        
    }
    
    
}

