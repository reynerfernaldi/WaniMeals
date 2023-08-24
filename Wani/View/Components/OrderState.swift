//
//  OrderState.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI
import CoreNFC
import UserNotifications

struct OrderState: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    var hapticManager = HapticManager()
    @Binding var data : [ItemOrder]
    @State var view = 0
    var body: some View {
        if view == 1{
            ProgressView(data: $data)
        }
        else {
            VStack(alignment: .leading) {
                ScrollView {
                    VStack{
                        //                    ForEach(data, id: \.self) { x in
                        //                        let y = foodList.first(where: { $0.name == x.name })
                        //                        CardMenu(item: x, food: y)
                        //
                        //                    }
                        ForEach(data.indices, id: \.self) { index in
                            let xBinding = $data[index]
                            let y = foodList.first(where: { $0.name == xBinding.wrappedValue.name })
                            CardMenu(item: xBinding, food: y!)
                        }
                    }
                }
                    Spacer()
                
            }
            .padding(.horizontal, 20)
            .background(Color("ColorBackground"))
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                nfcButton(data: self.$data).frame(width: 50, height: 50)
            }
            //            Footer(data: $data)
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
                    print(rpsSession.username)
                    view = 1
                    
//                    ForEach(data, id: \.self) { x in
//                        let menu = ItemOrder(id: UUID(), name: x.name, price: x.<#T##Int#>, qty: <#T##Int#>)
//                        let order = Orders(menus: , username: rpsSession.username, isReady: false, id: UUID())
//                        rpsSession.send(menu: order)
//
//                    }
//                    ForEach(data, id: \.id) { x in
                        let order = Orders(menus: data, username: rpsSession.username, isReady: false, id: UUID())
                        
                        rpsSession.send(menu: order)
                        
//                    }
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
        }
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

//struct OrderState_Previews: PreviewProvider {
//    static var previews: some View {
//        //        let binding = Binding<[String]>(get: { ["Bakso"] }, set: { _ in })
////        OrderState(data: .constant(["Bakso"]))
//    }
//}

