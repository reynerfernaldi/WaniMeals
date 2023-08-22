//
//  KitchenView.swift
//  Wani
//
//  Created by Reyner Fernaldi on 07/08/23.
//

import SwiftUI
import os

struct KitchenView: View {
//    @State var orderData: [Orders] = []
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @State private var isButtonClicked = false
    var body: some View {
        VStack{
            List{
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
                        Button(action: {
                            if let index = rpsSession.orders.firstIndex(where: { $0.id == order.id }) {
                                rpsSession.orders[index].isReady = true
                                rpsSession.send(menu: rpsSession.orders[index])
//                                isButtonClicked.toggle()
//                                NotificationCenter.default.post(name: Notification.Name("IsReadyChanged"), object: nil)

                            }
                        }) {
                            ZStack {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 358, height: 46)
                                  .background(Color("Primary"))
                                  .cornerRadius(10)
                                Text("DONE")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.white))
                            }
                            .frame(width: 358, height: 46)
                        }
                    }
                }
            }
//            .onReceive(rpsSession.$orders) { receivedMenus in
//                orderData.removeAll()
//                orderData.append(contentsOf: receivedMenus) // Tambahkan menu yang diterima ke daftar yang dipesan
//                print("Ini isi order data", orderData)
//            }
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
