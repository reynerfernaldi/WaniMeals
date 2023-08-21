//
//  CardMenu.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct CardMenu: View {
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
                    HStack{
                        Text("Quantity : " + String(qty))
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
                }.padding(.vertical, 5)
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

//struct CardMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        CardMenu(food: Food(name: "lorem", price: 20, picture: "x"))
//    }
//}
