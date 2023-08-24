//
//  CardProgress.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 23/08/23.
//

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
                Image(food.picture)
                    .resizable()
                    .frame(width: 90, height: 90)
                VStack(alignment: .leading){
                    Text(food.name)
                        .fontWeight(.bold)
                        .padding(.vertical, 1)
                    HStack{
                        Text("Qty : " + "\(qty)")
                            .fontWeight(.regular)
                            .foregroundColor(Color("Secondary"))
                    }
                    Text("On Progress")
                        .foregroundColor(.red)

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


struct CardProgress_Previews: PreviewProvider {
    static var previews: some View {
        CardProgress(food: Food(name: "Nasi Sop Iga", price: 20, picture: "NasiSopIga"), qty: 2)
    }
}
