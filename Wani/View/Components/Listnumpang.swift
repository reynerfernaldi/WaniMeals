//
//  Listnumpang.swift
//  Wani
//
//  Created by Vania on 09/08/23.
//

import SwiftUI

struct Listnumpang: View {
    @Binding var data : [String]
    var body: some View {
        VStack {
            List {
                ForEach(data, id: \.self)
                {
                    x in Text(x)
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

//struct Listnumpang_Previews: PreviewProvider {
//    static var previews: some View {
//        Listnumpang()
//    }
//}