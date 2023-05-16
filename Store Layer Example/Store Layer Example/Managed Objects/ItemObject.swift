//
//  ItemObject.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import Foundation
import CoreData

extension ItemObject {
    convenience init(context: NSManagedObjectContext, item: Item) {
        self.init(context: context)
        
        self.id = item.id
        self.timestamp = item.timestamp
        self.subItems = Set(item.subItems.map({ SubItemObject(context: context, subItem: $0) })) as NSSet
    }
}
