//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/15/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
