//
//  DataModel.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 21/08/23.
//

import Foundation

struct Orders: Codable, Hashable {
    var menus: [ItemOrder]
    var username: String
    var isReady: Bool
    var id: UUID
}
