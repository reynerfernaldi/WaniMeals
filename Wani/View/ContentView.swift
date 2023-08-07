//
//  ContentView.swift
//  cobanfc
//
//  Created by Vania on 01/08/23.
//

import SwiftUI
import CoreNFC

struct ContentView: View {
    @State var data : [String] = []
    var body: some View {
        NavigationStack
        {
            VStack(alignment: .leading) {
                CardTap()
                VStack{
                    if (data.isEmpty){
                        //                        EmptyState()
                        CardMenu()
                    }else {
                        List {
                            ForEach(data, id: \.self)
                            {
                                x in Text(x)
                            }
                        }
                        
                    }
                    nfcButton(data: self.$data).frame(width: 200, height: 50)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .background(Color("ColorBackground"))
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct nfcButton : UIViewRepresentable{
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
    
    @Binding var data : [String]
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Read NFC", for: .normal)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.beginScan(_:)), for: .touchUpInside)
        return button
    }
    
    
    //ini buat manage session
    func makeCoordinator() -> nfcButton.Coordinator {
        return Coordinator(data: $data)
    }
    
    class Coordinator : NSObject, NFCNDEFReaderSessionDelegate {
        var session : NFCNDEFReaderSession?
        @Binding var data : [String]
        
        init(data: Binding<[String]>)
        {
            _data = data
        }
        
        @objc func beginScan(_ sender: Any)
        {
            guard NFCNDEFReaderSession.readingAvailable else
            {
                print("hpny g support")
                return
            }
            session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: true)
            session?.alertMessage = "deketan"
            session?.begin()
        }
        func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
            if let readerError = error as? NFCReaderError{
                if (readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead) &&
                    (readerError.code != .readerSessionInvalidationErrorUserCanceled){
                    print("error : \(readerError.localizedDescription)")
                }
            }
            self.session = nil
        }
        
        func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
            for message in messages {
                for record in message.records{
                    guard
                        record.typeNameFormat == .absoluteURI || record.typeNameFormat == .nfcWellKnown,
                        let payload = String(data: record.payload, encoding: .utf8)
                    else {
                        continue
                    }
                    print(payload)
                    self.data.append(payload)
                }
            }
        }
    }
}
