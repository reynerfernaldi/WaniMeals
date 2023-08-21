//
//  ItemOrder.swift
//  Wani
//
//  Created by Vania on 21/08/23.
//

import Foundation

struct ItemOrder: Hashable {
    let name: String
    let price: Int
    var qty: Int
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(name)
           hasher.combine(price)
           hasher.combine(qty)
       }
}
