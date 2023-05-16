//
//  SubItemObject.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import Foundation
import CoreData

extension SubItemObject {
    convenience init(context: NSManagedObjectContext, subItem: SubItem) {
        self.init(context: context)
        
        self.id = subItem.id
        self.name = subItem.name
    }
}
