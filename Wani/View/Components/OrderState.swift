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
    @Binding var data : [ItemOrder]
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                ForEach(data, id: \.self) { x in
                    if let y = foodList.first(where: { $0.name == x.name }) {
                        CardMenu(food: y, qty: x.qty)
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

