//
//  Footer.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct Footer: View {
    @Binding var data : [ItemOrder]
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Total")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Text(formatPrice(calc()))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }.padding(.top, 11)
//            Text("Add more by tapping the top of your iPhone over food picture")
//                .font(.caption2)
//                .foregroundColor(Color("Secondary"))
//                .padding(.bottom, 11)
//                .padding(.top, 6)
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(width: .infinity, height: 50)
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(15)
                    Text("Place Order")
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal, 33)
        .padding(.vertical, 10)
        .background(Color("ColorBackground"))
//        .background(Color("Primary"))
    }
    
    func calc() -> Int {
            return data.reduce(0) { $0 + ($1.qty * $1.price) }
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

//struct Footer_Previews: PreviewProvider {
//    static var previews: some View {
//        Footer(data: $data)
//    }
//}
