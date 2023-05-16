//
//  Item.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import Foundation

struct Item: Hashable, Identifiable {
    var id: UUID
    let timestamp: Date
    var subItems: Set<SubItem>
}

extension Item {
    init(itemObject: ItemObject) {
        self.id = itemObject.id!
        self.timestamp = itemObject.timestamp!
        self.subItems = Set(itemObject.subItems!.map({ SubItem(subItemObject: $0 as! SubItemObject) }))
    }
}
