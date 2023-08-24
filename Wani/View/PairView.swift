//
//  PairView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 21/08/23.
//

import SwiftUI
import os

struct PairView: View {
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @State var data : [ItemOrder] = []
    
    @State var loading: Bool = false
    
    var logger = Logger()

    var body: some View {
        if (!rpsSession.paired) {
            VStack {
                if(loading){
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                    Text("Please wait, we're connecting you to the kitchen")
                        .padding()
                }
                if let serverPeer = rpsSession.availablePeers.first(where: { $0.displayName == "Server" }) {
                    if(!loading){
                        Button(action: {
                            rpsSession.serviceBrowser.invitePeer(serverPeer, to: rpsSession.session, withContext: nil, timeout: 30)
                            loading = true

                        }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .infinity, height: 45)
                                    .background(Color("Primary"))
                                    .cornerRadius(10)
                                Text("Connect To Server")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.white))
                            }
                            .padding(20)
                        }
                    }

                }
                else{
                    Text("Sorry our our server is unavailable, please try again later")
                }
                
                

//                List(rpsSession.availablePeers.filter{$0.displayName == "Server"}, id: \.self) { peer in
//                    Button(peer.displayName) {
//                        rpsSession.serviceBrowser.invitePeer(peer, to: rpsSession.session, withContext: nil, timeout: 30)
//                    }
//                }
            }
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
            }
        } else {
            NavigationStack{
                if (data.isEmpty){
                    EmptyState(data: $data)
                } else {
                    OrderState(data: $data)
                    //                Listnumpang(data: $data)
                }
            }
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//struct PairView_Previews: PreviewProvider {
//    static var previews: some View {
//        PairView()
//    }
//}
