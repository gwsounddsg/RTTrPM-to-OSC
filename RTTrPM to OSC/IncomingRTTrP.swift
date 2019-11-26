//
//  IncomingRTTrP.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/22/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation
import CocoaAsyncSocket





enum IncomingErrors: Error {
    case INCOMING_CanConvertStringToData
}





class Incoming: NSObject {
    
    var socket: GCDAsyncUdpSocket?
    
    
    override init() {
        super.init()
        socket = GCDAsyncUdpSocket(delegate: self, delegateQueue: DispatchQueue.main)
    }
    
    
    deinit {
        
    }
    
    
    func foo() throws {
        
    }
}



// MARK - GCDAsyncUdpSocketDelegate

extension Incoming: GCDAsyncUdpSocketDelegate {

    func udpSocket(_ sock: GCDAsyncUdpSocket, didConnectToAddress address: Data) {
        logging("Delegate did connect to address")
    }
    
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotConnect error: Error?) {
        logging("Delegate did not connect")
        if error != nil {
            logging(error!.localizedDescription, shiftRight: 1)
        }
    }
    
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
        logging("Delegate did send data with tag: \(tag)")
    }
    
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotSendDataWithTag tag: Int, dueToError error: Error?) {
        logging("Delegate did not send data with tag: \(tag)")
        if error != nil {
            logging(error!.localizedDescription, shiftRight: 1)
        }
    }
    
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didReceive data: Data, fromAddress address: Data, withFilterContext filterContext: Any?)
    {
        
        logging("Delegate did receive data")
        
        let addyAndPort = getAddyAndPort(address)
        
        if addyAndPort.0 == "" {
            logging("Failed to get address info", shiftRight: 1)
            return
        }
        
        logging(addyAndPort.0, shiftRight: 1)
        logging("Port: \(addyAndPort.1)", shiftRight: 1)
    }
    
    
    /*
     Most of this code found here:
     https://stackoverflow.com/questions/29294491/swift-obtaining-ip-address-from-socket-returns-weird-value
     */
    private func getAddyAndPort(_ data: Data) -> (String, Int) {
        var sock: sockaddr_in?
        var addy: String = ""
        var port: Int = 0
        
        sock = data.withUnsafeBytes {$0.load(as: sockaddr_in.self)}
        
        if sock != nil {
            switch Int32(sock!.sin_family) {
            case AF_INET: // ipv4
                let length = Int(INET_ADDRSTRLEN) + 2
                var buffer = [CChar](_unsafeUninitializedCapacity: length, initializingWith: {_, _ in})
                let hostCString = inet_ntop(AF_INET, &sock!.sin_addr, &buffer, socklen_t(length))
                
                addy = "Address IPv4: \(String(cString: hostCString!))"
                port = Int(UInt16(sock!.sin_port).byteSwapped)
                
            case AF_INET6: // ipv6
                var sock6 = data.withUnsafeBytes {$0.load(as: sockaddr_in6.self)}
                let length = Int(INET6_ADDRSTRLEN) + 2
                var buffer = [CChar](_unsafeUninitializedCapacity: length, initializingWith: {_, _ in})
                let hostCString = inet_ntop(AF_INET6, &sock6.sin6_addr, &buffer, socklen_t(length))
                
                addy = "Address IPv6: \(String(cString: hostCString!))"
                port = Int(UInt16(sock6.sin6_port).byteSwapped)
            
            default: break
            }
        }
        
        return (addy, port)
    }
    
    
    func udpSocketDidClose(_ sock: GCDAsyncUdpSocket, withError error: Error?) {
        logging("Delegate socket did close")
        if error != nil {
            logging(error!.localizedDescription, shiftRight: 1)
        }
    }
}





// MARK - Functionality

extension Incoming {
    
    func isIPv4Enabled() -> Bool {
        return socket!.isIPv4Enabled()
    }
    
    
    func isConnected() -> Bool {
        return socket!.isConnected()
    }
    
    
    func connectedAddress() -> String {
        return socket!.connectedHost() ?? ""
    }
    
    
    func connectedPort() -> Int {
        return Int(socket!.connectedPort())
    }
    
    
    func localAddress() -> String {
        return socket!.localHost() ?? ""
    }
    
    
    func localPort() -> Int {
        return Int(socket!.localPort())
    }

    
    func connect(port: Int) throws {
        try socket!.bind(toPort: UInt16(port))
        try socket!.beginReceiving()
    }
}
