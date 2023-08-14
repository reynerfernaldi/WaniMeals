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
    @Binding var data : [String]
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                ForEach(data, id: \.self){x in
                    let index = x.index(x.startIndex, offsetBy: 3)
                    let modifiedString = String(x[index...])
                    let y = foodList.first(where: { $0.name == modifiedString })
                    CardMenu(food: y!)
                    
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
        Footer()
    }
}

struct OrderState_Previews: PreviewProvider {
    static var previews: some View {
        //        let binding = Binding<[String]>(get: { ["Bakso"] }, set: { _ in })
        OrderState(data: .constant(["Bakso"]))
    }
}

