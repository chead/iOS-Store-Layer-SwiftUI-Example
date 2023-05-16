//
//  ItemStore.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import Foundation
import CoreData

class ItemStore: ItemStoring {
    let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func items() throws -> Set<Item> {
        let fetchRequest: NSFetchRequest<ItemObject> = ItemObject.fetchRequest()
        let itemObjects = try self.managedObjectContext.fetch(fetchRequest)
        
        return Set(itemObjects.map({ Item(itemObject: $0) }))
    }
    
    func addItem(item: Item) throws {
        let fetchRequest: NSFetchRequest<ItemObject> = ItemObject.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        
        let itemObjects = try self.managedObjectContext.fetch(fetchRequest)
        
        if(itemObjects.isEmpty) {
            let _ = ItemObject(context: self.managedObjectContext, item: item)
            
            try self.managedObjectContext.save()
        }
    }
    
    func removeItem(item: Item) throws {
        let fetchRequest: NSFetchRequest<ItemObject> = ItemObject.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        
        let itemObjects = try self.managedObjectContext.fetch(fetchRequest)
        
        for itemObject in itemObjects {
            self.managedObjectContext.delete(itemObject)
        }

        if self.managedObjectContext.hasChanges { try self.managedObjectContext.save() }
    }
}
