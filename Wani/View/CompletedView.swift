//
//  CompletedView.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 22/08/23.
//

import SwiftUI
import CoreHaptics
import AVKit
import AVFoundation

struct CompletedView: View {
    
    @EnvironmentObject var rpsSession: RPSMultipeerSession
    @State private var videoURL = Bundle.main.url(forResource: "check", withExtension: "mp4")!
    @State private var avPlayer: AVPlayer?
    @State var currentView: Int = 0
    
    var hapticManager = HapticManager()
    var body: some View {
        NavigationStack{
            
            switch currentView {
            case 1:
                PairView()
            default:
                completeView
            }
        }
    }
    
    var completeView: some View {
        VStack(alignment: .leading){
            VStack {
                
                if let player = avPlayer {
                    AVPlayerViewControllerRepresented(avPlayer: player)
                        .onAppear {
                            player.play()
                        }
                        .frame(height: 197)
                        .frame(width: 350)
                }
                
                Text("Your Food is Ready!")
                    .font(.title)
                    .padding(.top, 20)
                Text("Collect it at the counter!")
                    .font(.caption)
                
                Button(action: {
                    currentView = 1
                    hapticManager?.stopHaptics()
                }
                ) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: .infinity, height: 45)
                            .background(Color("Primary"))
                            .cornerRadius(10)
                        Text("DONE")
                            .fontWeight(.bold)
                            .foregroundColor(Color(.white))
                    }
                    .padding(20)
                }
                
                
            }
            .onAppear {
                avPlayer = AVPlayer(url: videoURL)
                avPlayer?.play()
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

struct AVPlayerViewControllerRepresented: UIViewControllerRepresentable {
    let avPlayer: AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AVPlayerViewControllerRepresented>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = avPlayer
        
        // Menghilangkan kontrol
        controller.showsPlaybackControls = false
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<AVPlayerViewControllerRepresented>) {
        // Do nothing
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}

