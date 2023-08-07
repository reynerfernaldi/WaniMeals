//
//  EmptyState.swift
//  Wani
//
//  Created by Vania on 07/08/23.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack(alignment: .leading) {
            //                CardTap()
            VStack{
                VStack
                {
                    Spacer()
                    Image("OrderEmpty")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                    Text("Your Order is Empty.")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                    Text("Place iPhone over food picture\nto add items.")
                        .font(.body)
                        .foregroundColor(Color("Secondary"))
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                
                Spacer()
//                NFCButton(data: self.$data).frame(width: 200, height: 50)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color("ColorBackground"))
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
