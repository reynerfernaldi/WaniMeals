//
//  nfcButton.swift
//  Wani
//
//  Created by Vania on 09/08/23.
//

import SwiftUI
import CoreNFC

struct nfcButton : UIViewRepresentable{
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
    
    @Binding var data : [ItemOrder]
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        //button.backgroundColor = UIColor(named: "Primary")
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor(named: "Primary"), for: .normal)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.beginScan(_:)), for: .touchUpInside)
        
        return button
    }
    
    
    //ini buat manage session
    func makeCoordinator() -> nfcButton.Coordinator {
        return Coordinator(data: $data)
    }
    
    class Coordinator : NSObject, NFCNDEFReaderSessionDelegate {
        @EnvironmentObject var rpsSession: RPSMultipeerSession
        var session : NFCNDEFReaderSession?
        @Binding var data : [ItemOrder]
        
        init(data: Binding<[ItemOrder]>)
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
            session?.alertMessage = "Add more by tapping the top of your iPhone over food picture"
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
                    let modifiedString = String(payload.suffix(from: payload.index(payload.startIndex, offsetBy: 3)))
                    //                    if let orderIndex = data.firstIndex(where: { $0.menus.contains { $0.name == modifiedString } }) {
                    //                        if let itemIndex = data[orderIndex].menus.firstIndex(where: { $0.name == modifiedString }) {
                    //                            let order = data[orderIndex]
                    //                            let item = order.menus[itemIndex]
                    //
                    //                            var modifiedItem = item
                    //                            modifiedItem.qty += 1
                    //
                    //                            var modifiedOrders = data
                    //                            modifiedOrders[orderIndex].menus[itemIndex] = modifiedItem
                    //
                    //                        }
                    //                    }
                    //                    else if let orderedFood = foodList.first(where: {$0.name == modifiedString}){
                    //
                    //                        let newItemOrder = ItemOrder(id: UUID(), name: orderedFood.name, price: orderedFood.price, qty: 1)
                    //
                    //                        if let orderIndex = data.firstIndex(where: { $0.username == rpsSession.username}) {
                    //                            data[orderIndex].menus.append(newItemOrder)
                    //                        }
                    //
                    //
                    //                    }
                    if let indexAda = data.firstIndex(where: {$0.name == modifiedString}){
                        data[indexAda].qty += 1
                    }
                    else if let orderedFood = foodList.first(where: {$0.name == modifiedString}){
                        data.append(ItemOrder(id: UUID(), name: orderedFood.name, price: orderedFood.price, qty: 1))
                    }
                    for x in data {
                        let itemString = x.name + " " + String(x.price) + " " + String(x.qty)
                        print(itemString)
                    }
                }
            }
        }
    }
}



//struct nfcButton_Previews: PreviewProvider {
//    static var previews: some View {
//        nfcButton()
//    }
//}
