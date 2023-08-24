//
//  Food.swift
//  Wani
//
//  Created by Vania on 10/08/23.
//

import Foundation

struct Food : Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var picture: String
}

var foodList: [Food] = [
    Food(name: "Nasi Sop Iga", price: 10000, picture: "x.png"),
    Food(name: "Cah Kangkung", price: 12000, picture: "x.png"),
    Food(name: "Nasi Lele Penyet", price: 15000, picture: "x.png"),
    Food(name: "Nasi Ayam Kremes", price: 15000, picture: "x.png"),
    Food(name: "Nasi Ayam Bakar", price: 6000, picture: "x.png")
]


//extension Food {
//    static var foodData: [Food] = [
//        .init(name: "Bakso", price: 10000, picture: "Bakso.png"),
//        .init(name: "Nasi Ayam Geprek", price: 12000, picture: "nasiAyamGeprek.png"),
//        .init(name: "Nasi Udang Geprek", price: 15000, picture: "nasiUdangGeprek.png"),
//        .init(name: "Indomie", price: 6000, picture: "indomie.png"),
//    ]
//}
