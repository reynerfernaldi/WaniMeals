//
//  Card.swift
//  WaniAppClip
//
//  Created by Aiffah Kiysa Waafi on 24/08/23.
//

import SwiftUI

struct Card: View {
    @Binding var item : Food
//    let food: Food
//    let qty: Int
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
                    Text(item.name)
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    Text(formatPrice(item.price))
                        .fontWeight(.regular)
                        .foregroundColor(Color("Secondary"))
                }.padding(.vertical, 5)
                Spacer()
            }.padding(10)
        }
    }
    func formatPrice(_ amount: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "."
        numberFormatter.decimalSeparator = ","
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        
        let formattedAmount = numberFormatter.string(from: NSNumber(value: amount)) ?? ""
        return "Rp" + formattedAmount
    }
}
