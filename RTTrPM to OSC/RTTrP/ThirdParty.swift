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


struct Coordinates<T>  {
    let x, y, z: T
}



// MARK: -
// MARK: Structures
// MARK: -

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
        Swift.print("==================Trackable Module==================")
        
        Swift.print("Integer Signature: ", terminator:"")
        printHex(intSig)
        Swift.print("")
        
        Swift.print("Floating Point Signature: ", terminator:"")
        printHex(fltSig)
        Swift.print("")
        
        Swift.print("Size: \(size)")
        Swift.print("Packet Name Length: \(nameLength)")
        Swift.print("Number of Modules: \(modCount)")
        
        Swift.print("Timestamp: ", terminator: "")
        printHex(timestamp)
        Swift.print("")
        
        Swift.print("==================Trackable Module==================")
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
    let coor: Coordinates<Double>
    
    
    func print() {
        Swift.print("==================Centroid Module==================")
        
        Swift.print("Module Size: \(size)")
        Swift.print("Latency: \(latency)")
        Swift.print("X Position: \(coor.x)")
        Swift.print("Y Position: \(coor.y)")
        Swift.print("Z Position: \(coor.z)")
        
        Swift.print("==================Centroid Module==================")
    }
}


struct LEDModule: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // LEDModule
    let size: uint16
    let latency: uint16
    let coor: Coordinates<Double>
    let index: uint8
    
    
    func print() {
        Swift.print("==================LED Module==================")
        
        Swift.print("Module Size: \(size)")
        Swift.print("Latency: \(latency)")
        Swift.print("X Position: \(coor.x)")
        Swift.print("Y Position: \(coor.y)")
        Swift.print("Z Position: \(coor.z)")
        Swift.print("LED Index: \(index)")
        
        Swift.print("==================LED Module==================")
    }
}


struct QuatModule: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    //QuatModule
    let size: uint16
    let latency: uint16
    let coor: Coordinates<Double>
    let w: Double
    
    
    func print() {
        Swift.print("==================Quaternion Module==================")
        
        Swift.print("Module Size: \(size)")
        Swift.print("Latency: \(latency)")
        Swift.print("Qx: \(coor.x)")
        Swift.print("Qy: \(coor.y)")
        Swift.print("Qz: \(coor.z)")
        Swift.print("Qw: \(w)")
        
        Swift.print("==================Quaternion Module==================")
    }
}


struct EulerModule: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // EulerModule
    let size: uint16
    let latency: uint16
    let order: uint16
    let r1, r2, r3: Double
    
    
    func print() {
        
    }
}


struct CentroidAccVelMod: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // CentroidAccVelMod
    let size: uint16
    let coor: Coordinates<Double>
    let acc: Coordinates<Float>
    let vel: Coordinates<Float>
    
    
    func print() {
        
    }
}


struct LEDAccVelMod: Packet {
    // Packet
    let type: uint8
    let intSig: uint16
    let fltSig: uint16
    
    // LEDAccVelMod
    let size: uint16
    let index: uint8
    let coor: Coordinates<Double>
    let acc: Coordinates<Float>
    let vel: Coordinates<Float>
    
    
    func print() {
        
    }
}
