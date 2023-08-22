//
//  CommonView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 09/08/23.
//

import SwiftUI
import UserNotifications

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
        NavigationStack{
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
    }
    
    var startViewBody: some View {
        VStack{
            VStack(alignment: .leading) {
                Text("Your Name")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack {
                    TextField("Nickname", text: $username)
                    
                }.modifier(customViewModifier(roundedCornes: 6, startColor: Color("Primary"), endColor: Color("LightPrimary"), textColor: .black))
            }.padding()
            
            //            #if APPCLIP
            //                Button("Server") {
            //                    rpsSession = RPSMultipeerSession(username: username)
            //                    currentView = 2
            //                }
            //            #else
            Button(action: {
                if username == "Server"{
                    rpsSession = RPSMultipeerSession(username: username)
                    currentView = 2
                } else {
                    rpsSession = RPSMultipeerSession(username: username)
                    currentView = 1
                }
                UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error {
                            print(error.localizedDescription)
                        }
                    }
            }) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: .infinity, height: 45)
                        .background(Color("Primary"))
                        .cornerRadius(10)
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                }
                .padding(20)
            }
            //            #endif
            
        }
    }
}

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
//            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
        
            .shadow(radius: 10)
    }
}

struct CommonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView()
    }
}
