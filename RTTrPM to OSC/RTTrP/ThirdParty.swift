//
//  ThirdParty.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation


protocol Packet {
    var type: uint8 {get}
    var intSig: uint16 {get} // not sure what this is for
    var fltSig: uint16 {get} // not sure what this is for
    
    func print()
}


struct Trackable: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // Trackable
    let size: uint16
    let nameLength: uint8
    let name: String
    let modCount: uint8
    let timestamp: uint32

    
    func print() {
        
    }
}


struct CentroidMod: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // Centroid
    let size: uint16
    let latency: uint16
    let x: Double
    let y: Double
    let z: Double
    
    
    func print() {
        
    }
}
