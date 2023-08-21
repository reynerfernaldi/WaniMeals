//
//  OrderState.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI
import Swift
import CoreNFC

struct OrderState: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @Binding var data : [Orders]
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
//                ForEach(data, id: \.self) { x in
//                    if let y = foodList.first(where: { $0.name == x.name }) {
//                        CardMenu(food: y, qty: x.qty)
//                    }
//                }
                ForEach(rpsSession.orders
                    .filter { $0.username == rpsSession.username }
                        , id: \.id) { order in
                    VStack(alignment: .leading){
                        Text("ID: \(order.username)")
                        Text("Status: \(order.isReady)" as String)
                        
                        ForEach(order.menus, id: \.id) { i in
//                            HStack{
//                                Text("Menu: \(i.name)")
//                                Text("Qty: \(i.qty)")
//                            }
                            if let y = foodList.first(where: { $0.name == i.name }) {
                                CardMenu(food: y, qty: i.qty)
                            }
                        }
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
        Footer(data: $data)
    }
}

//struct OrderState_Previews: PreviewProvider {
//    static var previews: some View {
//        //        let binding = Binding<[String]>(get: { ["Bakso"] }, set: { _ in })
////        OrderState(data: .constant(["Bakso"]))
//    }
//}

