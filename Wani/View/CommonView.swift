//
//  CommonView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 09/08/23.
//

import SwiftUI

struct CommonView: View {
    //    @State var data : [String] = []
    //    var body: some View {
    //        NavigationStack
    //        {
    //            if (data.isEmpty){
    //                EmptyState(data: $data)
    //            } else {
    //                OrderState(data: $data)
    ////                Listnumpang(data: $data)
    //            }
    //        }
    //    }
    @State var rpsSession: RPSMultipeerSession?
    @State var currentView: Int = 0
    @State var username = ""
    var body: some View {
        
        switch currentView {
        case 1:
            PairView()
                .environmentObject(rpsSession!)
        case 2:
            KitchenView()
                .environmentObject(rpsSession!)
        default:
            startViewBody
        }
    }
    
    var startViewBody: some View {
        VStack{
            TextField("Nickname", text: $username)
                .padding([.horizontal], 75.0)
                .padding(.bottom, 24)
                .textFieldStyle(RoundedBorderTextFieldStyle())

//            #if APPCLIP
                Button("Server") {
                    rpsSession = RPSMultipeerSession(username: username)
                    currentView = 2
                }
//            #else
                Button("Order") {
                    rpsSession = RPSMultipeerSession(username: username)
                    currentView = 1
                }
//            #endif
            
        }
    }
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
