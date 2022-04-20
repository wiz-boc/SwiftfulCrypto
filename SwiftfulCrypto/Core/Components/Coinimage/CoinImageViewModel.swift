//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/18/22.
//

import SwiftUI
import Combine


class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    private var cancellables = Set<AnyCancellable>()
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.isLoading = false
            } receiveValue: { [weak self] returnImage in
                guard let self = self else { return }
                self.image = returnImage
            }
            .store(in: &cancellables)

    }
}
