//
//  KitchenView.swift
//  Wani
//
//  Created by Reyner Fernaldi on 07/08/23.
//

import SwiftUI
import os

struct KitchenView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @State private var isButtonClicked = false
    var body: some View {
        VStack{
            List{
                ForEach($rpsSession.orders, id: \.id) { $order in
                    VStack{
                        HStack
                        {
                            let y = order.username
                            Text("Customer : " + "\(y)")
                                .fontWeight(.bold)
                                .padding(.vertical, 1)
                            Spacer()
                        }
                        VStack(alignment: .leading){
                            ForEach(order.menus.indices, id: \.self) { menuIndex in
                                let i = order.menus[menuIndex]
                                let y = foodList.first(where: { $0.name == i.name })
                                if let index = rpsSession.orders.firstIndex(where: { $0.id == order.id }) {
                                    let menuItemBinding = $rpsSession.orders[index].menus[menuIndex]
                                    CardMenuKitchen(item: menuItemBinding, food: y!)
                                }
                            }

                        }
                        Button(action: {
                            if let index = rpsSession.orders.firstIndex(where: { $0.id == order.id }) {
                                rpsSession.orders[index].isReady = true
                                rpsSession.send(menu: rpsSession.orders[index])

                            }
                        }) {
                            ZStack {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 310, height: 46)
                                  .background(Color("Primary"))
                                  .cornerRadius(10)
                                Text("DONE")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.white))
                            }
                            .frame(width: 310, height: 46)
                        }
                    }
                }
            }

        }
        .navigationTitle("Kitchen")
        .navigationBarTitleDisplayMode(.large)
        .alert("Received an invite from \(rpsSession.recvdInviteFrom?.displayName ?? "ERR")!", isPresented: $rpsSession.recvdInvite) {
            Button("Accept invite") {
                if (rpsSession.invitationHandler != nil) {
                    rpsSession.invitationHandler!(true, rpsSession.session)
                }
            }
            Button("Reject invite") {
                if (rpsSession.invitationHandler != nil) {
                    rpsSession.invitationHandler!(false, nil)
                }
            }
        }.task {
            rpsSession.serviceAdvertiser.startAdvertisingPeer()
        }
    }
}

struct KitchenView_Previews: PreviewProvider {
    static var previews: some View {
        KitchenView()
    }
}
