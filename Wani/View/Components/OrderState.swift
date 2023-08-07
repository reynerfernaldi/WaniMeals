//
//  OrderState.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI

struct OrderState: View {
    var body: some View {
        VStack(alignment: .leading) {
            //                CardTap()
            VStack{
                VStack
                {
                    CardMenu()
                    Text("Add more by tapping the top of your iPhone over food picture")
                        .font(.caption2)
                        .foregroundColor(Color("Secondary"))
                        .padding(5)
                }
//                nfcButton(data: self.$data).frame(width: 200, height: 50)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color("ColorBackground"))
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.large)
        Footer()
    }
}

struct OrderState_Previews: PreviewProvider {
    static var previews: some View {
        OrderState()
    }
}
