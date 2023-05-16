//
//  SubItem.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import Foundation

struct SubItem: Hashable, Identifiable {
    var id: UUID
    let name: String
}

extension SubItem {
    init(subItemObject: SubItemObject) {
        self.id = subItemObject.id!
        self.name = subItemObject.name!
    }
}
