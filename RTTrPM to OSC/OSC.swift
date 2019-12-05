//
//  OSC.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 12/5/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation
import SwiftOSC




struct DS100Data {
    let mapping: String
    let x: Double
    let y: Double
    
    init(_ mapping: String, x: Double, y: Double) {
        self.mapping = mapping
        self.x = x
        self.y = y
    }
}





class OSC {
    
    let client: OSCClient
    var address = "/dbaudio1/coordinatemapping/source_position_xy/"
    
    
    init(_ address: String, _ port: Int) {
        client = OSCClient(address: address, port: port)
    }
    
    
    func sendMessage(_ data: DS100Data) {
        let destination = address + data.mapping
        let message = OSCMessage(OSCAddressPattern(destination), data.x, data.y)
        client.send(message)
    }
}
