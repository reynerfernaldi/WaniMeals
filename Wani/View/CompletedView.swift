//
//  CompletedView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 22/08/23.
//

import SwiftUI
import CoreHaptics

struct CompletedView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    var hapticManager = HapticManager()
    var body: some View {
        VStack{
            ForEach(rpsSession.orders, id: \.id) { order in
                VStack{
                    VStack(alignment: .leading){
                        ForEach(order.menus, id: \.id) { i in
                            //                                HStack{
                            //                                    Text("Menu: \(i.name)")
                            //                                    Text("Qty: \(i.qty)")
                            //                                }
                            if let y = foodList.first(where: { $0.name == i.name }) {
                                CardMenu(food: y, qty: i.qty)
                            }
                        }
                    }
                }
            }
            
            Text("PESANAN KELAR")
        }
            .onAppear{
                print("appp")
                if rpsSession.isChange == true {
                    print("hapticcc")
                    hapticManager?.prepareHaptics()
                    hapticManager?.doneSuccess()
                }
            }
    }
}

//struct CompletedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompletedView()
//    }
//}
