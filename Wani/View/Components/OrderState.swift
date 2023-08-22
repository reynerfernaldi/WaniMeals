//
//  OrderState.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 07/08/23.
//

import SwiftUI
import CoreNFC
import UserNotifications

struct OrderState: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @Binding var data : [ItemOrder]
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                ForEach(data, id: \.self) { x in
                    if let y = foodList.first(where: { $0.name == x.name }) {
                        CardMenu(food: y, qty: x.qty)
                    }
                }
            }
            Spacer()
        }
        //        .alert(isPresented: $rpsSession.isChange) {
        //            Alert(
        //                title: Text("Order Status Changed"),
        //                message: Text("The order status has changed to ready."),
        //                dismissButton: .default(Text("OK"))
        //            )
        //        }
        
        .onChange(of: rpsSession.isChange) { newValue in
            if newValue {
                print("hvbfewjnd \(rpsSession.orders)")
                scheduleNotification(title: "tess", subtitle: "wod", secondsLater: 2, isRepeating: false)
            }
        }

        .padding(.horizontal, 20)
        .background(Color("ColorBackground"))
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            nfcButton(data: self.$data).frame(width: 50, height: 50)
        }
        Footer(data: $data)
    }
    
    func scheduleNotification(title: String, subtitle: String, secondsLater: TimeInterval, isRepeating: Bool) {
        //Request Access
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error {
                print("Notification access not granted.", error.localizedDescription)
            }
        }
        //Define the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        
        //Define the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsLater, repeats: isRepeating)
        
        //Define the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //Add request to notication center of the current app
        UNUserNotificationCenter.current().add(request)
    }

}

//struct OrderState_Previews: PreviewProvider {
//    static var previews: some View {
//        //        let binding = Binding<[String]>(get: { ["Bakso"] }, set: { _ in })
////        OrderState(data: .constant(["Bakso"]))
//    }
//}

