//
//  ProgressView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 22/08/23.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @Binding var data : [ItemOrder]
    @State var view = 0
    var body: some View {
        if view == 1 {
            CompletedView()
                .environmentObject(rpsSession)
        }
        else {
            VStack(alignment: .leading) {
                VStack{
                    ForEach(data, id: \.self) { x in
                        if let y = foodList.first(where: { $0.name == x.name }) {
                            CardProgress(food: y, qty: x.qty)
                        }
                    }
                }
                Spacer()
            }
            .onChange(of: rpsSession.isChange) { newValue in
                print("masuk1 \(rpsSession.isChange)")
                if newValue == true {
                    view = 1
                    scheduleNotification(title: "Wani Meals", subtitle: "Your Food is Done", secondsLater: 2, isRepeating: false)
                }
            }
            .padding(.horizontal, 20)
            .background(Color("ColorBackground"))
            
        }
    }

    func scheduleNotification(title: String, subtitle: String, secondsLater: TimeInterval, isRepeating: Bool) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error {
                print("Notification access not granted.", error.localizedDescription)
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondsLater, repeats: isRepeating)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

//struct ProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressView()
//    }
//}
