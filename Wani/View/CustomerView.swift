//
//  CustomerView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 21/08/23.
//

import SwiftUI

//struct CustomerView: View {
//    @EnvironmentObject var rpsSession: RPSMultipeerSession
////    @State private var orderData: Orders = []
////    @Binding var data : [ItemOrder]
//    @State private var showAlert = false
//    @State private var username = ""
//    var body: some View {
//        VStack{
//            List{
//                ForEach(rpsSession.orders
//                    .filter { $0.username == rpsSession.username }
//                        , id: \.id) { order in
//                    VStack(alignment: .leading){
//                        Text("ID: \(order.username)")
//                        Text("Status: \(order.isReady)" as String)
//                        ForEach(order.menus, id: \.id) { i in
////                            HStack{
////                                Text("Menu: \(i.name)")
////                                Text("Qty: \(i.qty)")
////                            }
//                            if let y = foodList.first(where: { $0.name == i.name }) {
//                                CardMenu(food: y, qty: i.qty)
//                            }
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                print("executed2")
//                // Mendengarkan notifikasi ketika status isReady berubah
//                NotificationCenter.default.addObserver(forName: Notification.Name("IsReadyChanged"), object: nil, queue: .main) { _ in
//                    showAlert = true// Tampilkan alert ketika notifikasi diterima
//                    print ("executed2")
//                }
//            }
//            .alert(isPresented: $showAlert) {
//                Alert(
//                    title: Text("Order Status Changed"),
//                    message: Text("The order status has changed to ready."),
//                    dismissButton: .default(Text("OK"))
//                )
//            }
//
////            Button("Send Menu") {
//////                let menu = Orders(menus: [Menu(makanan: "Nasi Goreng", quantity: 2, id: UUID()),
//////                                          Menu(makanan: "Nasi Pecel", quantity: 4, id: UUID())], username: rpsSession.username, isReady: false, id: UUID())
////
//////                orderData.append( menu)
////                let orderData = Orders(menus: [ItemOrder()], username: rpsSession.username, isReady: false, id: UUID())
////                rpsSession.send(menu: orderData)
////            }
//        }
//
//
//        //        VStack{
//        //            List{
//        //                ForEach(orderData, id: \.id) { menu in
//        //                    Text("ID: \(menu.username)")
//        //                        ForEach(menu.menus, id: \.id) { i in
//        //                            HStack{
//        //                                Text("Menu: \(i.makanan)")
//        //                                Text("Qty: \(i.quantity)")
//        //                            }
//        //                    }
//        //                    .padding()
//        //                }
//        //            }
//        //            Button("Send Menu") {
//        //                let menu = Orders(menus: [Menu(makanan: "Nasi Goreng", quantity: 2, id: UUID()),
//        //                                          Menu(makanan: "Nasi Pecel", quantity: 4, id: UUID())], username: rpsSession.username, isReady: false, id: UUID())
//        //                rpsSession.send(menu: menu)
//        ////                rpsSession.sendToServer(menu: menu)
//        ////                orders.append(menu) // Tambahkan menu ke daftar yang dipesan
//        //            }
//        //        }
//
//
//
//
//
//
//
//
//
//        //        List{
//        //            cart
//        //        }
//        //        .onReceive(rpsSession.$receivedMenu.receive(on: DispatchQueue.main)) { receivedMenus in
//        //            orders.append(contentsOf: receivedMenus) // Tambahkan menu yang diterima ke daftar yang dipesan
//        //        }
//    }
//
//    //    var cart: some View {
//    ////        VStack {
//    ////            Button("Send Menu") {
//    ////                let menu = Menu(makanan: "Nasi Goreng", quantity: 2, id: UUID())
//    //////                rpsSession.send(menu: menu)
//    //////                orders.append(menu) // Tambahkan menu ke daftar yang dipesan
//    ////            }
//    ////        }
//    ////        .onReceive(rpsSession.$receivedMenu.receive(on: DispatchQueue.main)) { receivedMenu in
//    ////            if let receivedMenu = receivedMenu {
//    ////                orders.append(receivedMenu) // Tambahkan menu yang diterima ke daftar yang dipesan
//    ////            }
//    ////        }
//    //    }
//}
//
//struct CustomerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomerView()
//    }
//}
//
