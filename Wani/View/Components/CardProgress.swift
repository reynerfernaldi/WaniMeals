//
//  CardProgress.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 23/08/23.
//

import SwiftUI

import SwiftUI

struct CardProgress: View {
    let food: Food
    let qty: Int
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
                    Text(food.name)
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    Text(formatPrice(food.price))
                        .fontWeight(.regular)
                        .foregroundColor(Color("Secondary"))
                }.padding(.vertical, 5)
                Text("On Progress")
                    .foregroundColor(.red)
                    .offset(y: -35)
                    .padding(.leading, 35)
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
