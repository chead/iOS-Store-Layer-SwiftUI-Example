//
//  ItemStorePreview.swift
//  Store Layer Example
//
//  Created by chead on 1/27/23.
//

import Foundation

class ItemStorePreview: ItemStoring {
    var storedItems: Set<Item> = []
    
    func items() throws -> Set<Item> {
        return storedItems
    }
    
    func addItem(item: Item) throws {
        self.storedItems.insert(item)
    }
    
    func removeItem(item: Item) throws {
        self.storedItems.remove(item)
    }
}
