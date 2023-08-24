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
                            VStack{
                                Image("Logo")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(i.name)")
                                Text("\(i.price)")
                                Text("Take Your Food")
                            }
                        }
                    }
                }
            }
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
