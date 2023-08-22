//
//  MPConnectionManager.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 21/08/23.
//

import MultipeerConnectivity
import os

class RPSMultipeerSession: NSObject, ObservableObject {
    
    private let serviceType = "Wani"
    private var myPeerID: MCPeerID
    
    public let serviceAdvertiser: MCNearbyServiceAdvertiser
    public let serviceBrowser: MCNearbyServiceBrowser
    public let session: MCSession
    
    private let log = Logger()
    
    @Published var availablePeers: [MCPeerID] = []
    var username: String // Tambahkan properti ini
    //    @Published var receivedMove: Move = .unknown
    @Published var orders: [Orders]=[]
    @Published var recvdInvite: Bool = false
    @Published var recvdInviteFrom: MCPeerID? = nil
    @Published var paired: Bool = false
    @Published var invitationHandler: ((Bool, MCSession?) -> Void)?
    @Published var isChange: Bool = false
    
    init(username: String) {
        let peerID = MCPeerID(displayName: username)
        self.myPeerID = peerID
        
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        self.username = username
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
    }
    
    func sendToAllClients(menu: Orders) {
        do {
            var menuWithUsername = menu
            menuWithUsername.username = "Server" // Atur username host di sini
            let menuData = try JSONEncoder().encode(menuWithUsername)
            try session.send(menuData, toPeers: session.connectedPeers, with: .reliable)
        } catch {
            log.error("Error sending to all clients: \(String(describing: error))")
        }
    }
    
    func sendToServer(menu: Orders) {
        if let serverPeerID = availablePeers.first(where: { $0.displayName == "Server" }) {
            do {
                var menuWithUsername = menu
                menuWithUsername.username = username
                let menuData = try JSONEncoder().encode(menuWithUsername)
                try session.send(menuData, toPeers: [serverPeerID], with: .reliable)
            } catch {
                log.error("Error sending to server: \(String(describing: error))")
            }
        }
    }
    
    func send(menu: Orders) {
        if !session.connectedPeers.isEmpty {
            log.info("sendMove: \(String(describing: menu)) to \(self.session.connectedPeers[0].displayName)")
            do {
                self.isChange = false
                var menuWithUsername = menu // Salin objek menu
                menuWithUsername.username = self.username
                let menuData = try JSONEncoder().encode(menu)
                try session.send(menuData, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                log.error("Error sending: \(String(describing: error))")
            }
        }
    }
}

extension RPSMultipeerSession: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        //TODO: Inform the user something went wrong and try again
        log.error("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        log.info("didReceiveInvitationFromPeer \(peerID)")
        
        DispatchQueue.main.async {
            // Tell PairView to show the invitation alert
            self.recvdInvite = true
            // Give PairView the peerID of the peer who invited us
            self.recvdInviteFrom = peerID
            // Give PairView the `invitationHandler` so it can accept/deny the invitation
            self.invitationHandler = invitationHandler
        }
    }
}

extension RPSMultipeerSession: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        //TODO: Tell the user something went wrong and try again
        log.error("ServiceBroser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        log.info("ServiceBrowser found peer: \(peerID)")
        // Add the peer to the list of available peers
        DispatchQueue.main.async {
            self.availablePeers.append(peerID)
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        log.info("ServiceBrowser lost peer: \(peerID)")
        // Remove lost peer from list of available peers
        DispatchQueue.main.async {
            self.availablePeers.removeAll(where: {
                $0 == peerID
            })
        }
    }
}

extension RPSMultipeerSession: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        log.info("peer \(peerID) didChangeState: \(state.rawValue)")
        
        switch state {
        case MCSessionState.notConnected:
            // Peer disconnected
            DispatchQueue.main.async {
//                self.paired = false
                print("not connected")
            }

            break
        case MCSessionState.connected:
            // Peer connected
            DispatchQueue.main.async {
                self.paired = true
                print("connected")
            }
            // We are paired, stop accepting invitationsß
            
//            if self.username == "Server" {
                // If yes, start advertising again
                serviceAdvertiser.startAdvertisingPeer()
//            }
//            else{
//                serviceAdvertiser.stopAdvertisingPeer()
//            }
            break
        default:
            // Peer connecting or something else
            DispatchQueue.main.async {
                self.paired = false
            }
            break
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        do {
            let receivedMenu = try JSONDecoder().decode(Orders.self, from: data)
            print ("ini recevemenu MPC", receivedMenu)
            DispatchQueue.main.async {
                if let index = self.orders.firstIndex(where: {$0.id == receivedMenu.id}){
                    print("Ketemu! di index ke", index)
                    self.isChange = true
                    self.orders[index].isReady = true
                    self.objectWillChange.send()
                } else {
                    print("Buat Baru!")
                    self.isChange = true
                    if self.username == receivedMenu.username{
                        self.orders.append(receivedMenu) // Set nilai receivedMenu di dalam session
                    }else if self.username == "Server" {
                        self.orders.append(receivedMenu)
                    }
                    
                }
                
                
//                self.orders.append(receivedMenu) // Set nilai receivedMenu di dalam session
                print("Received")
                print("Ini Isinya MPC, \(self.orders)")
                
            }
            
        } catch {
            log.error("Error decoding received data: \(error)")
        }
    }
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        log.error("Receiving streams is not supported")
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didReceiveCertificate certificate: [Any]?, fromPeer peerID: MCPeerID, certificateHandler: @escaping (Bool) -> Void) {
        certificateHandler(true)
    }
}
