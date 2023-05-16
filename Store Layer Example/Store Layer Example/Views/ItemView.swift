//
//  ItemView.swift
//  Store Layer Example
//
//  Created by chead on 12/10/22.
//

import Foundation

import SwiftUI

struct ItemView: View {
    let itemViewModel: ItemViewModel
    
    var body: some View {
        List {
            ForEach(Array(self.itemViewModel.item.subItems)) { subItem in
                Text(subItem.name)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let subItems = Set([SubItem(id: UUID(), name: "Foo"), SubItem(id: UUID(), name: "Bar")])
        
        let item = Item(id: UUID(), timestamp: Date(), subItems: subItems)
        
        let itemViewModel = ItemViewModel(item: item)
        
        return ItemView(itemViewModel: itemViewModel)
    }
}
