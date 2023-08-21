//
//  CommonView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 09/08/23.
//

import SwiftUI

struct CommonView: View {
    @State var data : [ItemOrder] = []
    var body: some View {
        NavigationStack
        {
            if (data.isEmpty){
                EmptyState(data: $data)
            } else {
                OrderState(data: $data)
//                Listnumpang(data: $data)
            }
        }
    }
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
