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
        Text("PESANAN KELAR")
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

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
