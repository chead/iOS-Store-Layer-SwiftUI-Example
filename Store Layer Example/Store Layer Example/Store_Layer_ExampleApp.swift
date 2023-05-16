//
//  Store_Layer_ExampleApp.swift
//  Store Layer Example
//
//  Created by chead on 12/8/22.
//

import SwiftUI

@main
struct Store_Layer_ExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ItemsView(itemsViewModel: ItemsViewModel(itemStore: ItemStore(managedObjectContext: persistenceController.container.viewContext)))
        }
    }
}
