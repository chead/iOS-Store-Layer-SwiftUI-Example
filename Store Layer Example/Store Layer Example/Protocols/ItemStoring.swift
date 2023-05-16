//
//  ItemStoring.swift
//  Store Layer Example
//
//  Created by chead on 1/27/23.
//

import Foundation

protocol ItemStoring {
    func items() throws -> Set<Item>
    func addItem(item: Item) throws
    func removeItem(item: Item) throws
}
