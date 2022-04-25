//
//  PortfolioDataService.swift
//  SwiftfulCrypto
//
//  Created by wizz on 4/24/22.
//

import Foundation
import CoreData

class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { [weak self] (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self?.getPortfolio()
        }
    }
    //MARK: PUBLIC
    
    func updatePortfolio(coin: CoinModel, amount: Double){
        if let entity = savedEntities.first(where: { $0.coinID == coin.id}) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }
        }else{
            add(coin: coin, amount: amount)
        }
    }
    
    
    //MARK: - PRIVATE
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch {
            print("Error fetching portfolio Entities. \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double){
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double){
        entity.amount = amount
        applyChanges()
    }
    
    private func remove(entity: PortfolioEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do{
            try container.viewContext.save()
        }catch{
            print("Error saving to Cora Data \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolio()
    }
}
