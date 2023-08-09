//
//  OrderState.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI
import CoreNFC

struct OrderState: View {
    @Binding var data : [String]
    var body: some View {
        VStack(alignment: .leading) {
            //                CardTap()
            VStack{
                VStack
                {
                    CardMenu()
//                    
                }
//
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

//struct OrderState_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderState(data: $data)
//    }
//}

