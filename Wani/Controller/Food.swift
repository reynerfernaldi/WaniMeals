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
    Food(name: "Nasi Sop Iga", price: 20000, picture: "NasiSopIga"),
    Food(name: "Cah Kangkung", price: 8000, picture: "CahKangkung"),
    Food(name: "Nasi Lele Penyet", price: 12000, picture: "NasiLelePenyet"),
    Food(name: "Nasi Ayam Kremes", price: 15000, picture: "NasiAyamKremes"),
    Food(name: "Nasi Ayam Bakar", price: 15000, picture: "NasiAyamBakar")
]


//extension Food {
//    static var foodData: [Food] = [
//        .init(name: "Bakso", price: 10000, picture: "Bakso.png"),
//        .init(name: "Nasi Ayam Geprek", price: 12000, picture: "nasiAyamGeprek.png"),
//        .init(name: "Nasi Udang Geprek", price: 15000, picture: "nasiUdangGeprek.png"),
//        .init(name: "Indomie", price: 6000, picture: "indomie.png"),
//    ]
//}
