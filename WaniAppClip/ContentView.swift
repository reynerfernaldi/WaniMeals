//
//  ContentView.swift
//  WaniAppClip
//
//  Created by Aiffah Kiysa Waafi on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var foodList: [Food] = [
        Food(name: "Bakso", price: 10000, picture: "x.png"),
        Food(name: "Nasi Ayam Geprek", price: 12000, picture: "x.png"),
        Food(name: "Nasi Udang Geprek", price: 15000, picture: "x.png"),
        Food(name: "Nasi Ayam Kremes", price: 15000, picture: "x.png"),
        Food(name: "Indomie", price: 6000, picture: "x.png")
    ]
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                VStack{
                    ForEach($foodList, id: \.id) { x in
                        Card(item: x)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .background(Color("ColorBackground"))
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
