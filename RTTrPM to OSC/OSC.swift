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
    let input: String
    let x: Double
    let y: Double
    
    init(_ mapping: String, input: String, x: Double, y: Double) {
        self.mapping = mapping
        self.input = input
        self.x = x
        self.y = y
    }
    
    func addy() -> String {
        return "\(mapping)/\(input)"
    }
}





class OSC {
    
    let client: OSCClient
    var address = "/dbaudio1/coordinatemapping/source_position_xy/"
    
    
    init(_ address: String, _ port: Int) {
        client = OSCClient(address: address, port: port)
    }
    
    
    func sendMessage(_ data: [DS100Data]) {
        let bundle = OSCBundle()
        
        for each in data {
            let destination = address + each.addy()
            bundle.add(OSCMessage(OSCAddressPattern(destination), each.x, each.y))
        }
        
        client.send(bundle)
    }
    
    
    
}
