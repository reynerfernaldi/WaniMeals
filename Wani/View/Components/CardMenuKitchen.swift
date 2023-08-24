//
//  CardMenu.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct CardMenuKitchen: View {
    @Binding var item : ItemOrder
    let food: Food
//    let qty: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: .infinity, height: 120)
            
            HStack{
                Image(food.picture)
                    .resizable()
                    .frame(width: 90, height: 90)
                VStack(alignment: .leading){
                    Text(item.name)
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    HStack{
                        Text("Quantity : " + String(item.qty))
                            .font(.body)
                            .fontWeight(.regular)
                            .padding(.vertical, 10)
                        Spacer()
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
