//
//  ItemsView.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import SwiftUI

struct ItemsView: View {
    @ObservedObject var itemsViewModel: ItemsViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(itemsViewModel.items)) { item in
                    NavigationLink(item.timestamp.ISO8601Format()) {
                        ItemView(itemViewModel: ItemViewModel(item: item))
                    }
                }
            }
            .navigationTitle("Items")
            .toolbar {
                Button {
                    let subItems = Set([SubItem(id: UUID(), name: "Foo"), SubItem(id: UUID(), name: "Bar")])

                    let item = Item(id: UUID(), timestamp: Date(), subItems: subItems)

                    self.itemsViewModel.addItem(item: item)
                 } label: {
                     Image(systemName: "plus.circle.fill")
                 }
            }
        }
        .onAppear() {
            self.itemsViewModel.getItems()
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView(itemsViewModel: ItemsViewModel(itemStore: ItemStorePreview()))
    }
}
