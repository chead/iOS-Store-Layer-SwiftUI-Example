//
//  ItemsViewModel.swift
//  Store Layer Example
//
//  Created by chead on 12/9/22.
//

import Foundation
import CoreData

class ItemsViewModel: ObservableObject {
    let itemStore: ItemStoring
    
    @Published var items: Set<Item> = []
    
    init(itemStore: ItemStoring) {
        self.itemStore = itemStore
    }
    
    func getItems() {
        self.items = (try? self.itemStore.items()) ?? []
    }
    
    func addItem(item: Item) {
        try? self.itemStore.addItem(item: item)
        
        self.items.insert(item)
    }
}
