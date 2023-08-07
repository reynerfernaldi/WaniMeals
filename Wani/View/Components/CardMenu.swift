//
//  CardMenu.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct CardMenu: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: .infinity, height: 120)
            
            HStack{
                Image("AyamGeprek")
                    .resizable()
                    .frame(width: 90, height: 90)
                VStack(alignment: .leading){
                    Text("Nasi Ayam Geprek")
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    Text("Rp12.000")
                        .fontWeight(.regular)
                        .foregroundColor(Color("Secondary"))
                    HStack{
                        Text("Quantity")
                            .font(.body)
                            .fontWeight(.regular)
                            .padding(.vertical, 10)
                        Spacer()
                        HStack(alignment: .center, spacing: 14.5) {
                            Image(systemName: "minus")
                            Image(systemName: "plus")
                        }
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        .padding(.vertical, 5)
                        .frame(width: 94, height: 32, alignment: .center)
                        .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                        .cornerRadius(8)
                    }
                }.padding(.horizontal, 5)
            }.padding(10)
        }
    }
}

struct CardMenu_Previews: PreviewProvider {
    static var previews: some View {
        CardMenu()
    }
}
