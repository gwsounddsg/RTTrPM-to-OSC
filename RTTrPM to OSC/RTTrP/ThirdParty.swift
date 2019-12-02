//
//  ThirdParty.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation





protocol Packet {
    var type: RTTrP_PacketModules {get}
    
    func print()
}




enum PacketError: Error {
    case cannotCreateStringForName
    case typeShouldBeTrackable
    
    enum ByteCountTooSmallToInit: Error {
        case trackable
    }
}





struct Coordinates<T>  {
    let x, y, z: T
}



// MARK: -
// MARK: Structures
// MARK: -

struct Trackable: Packet {
    // Packet
    let type: RTTrP_PacketModules
    
    // Trackable
    let size: uint16
    let nameLength: uint8
    let name: String
    let modCount: uint8
    let timestamp: uint32
    
    var centroidMod: CentroidMod?
    var ledModules: [LEDModule] = []
    var quatModule: QuatModule?
    var eulerModule: EulerModule?
    var centroidAccVelMod: CentroidAccVelMod?
    var lavMods: [LEDAccVelMod] = []
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 6 {throw PacketError.ByteCountTooSmallToInit.trackable}
        
        // Type - 1 byte
        type = RTTrP_PacketModules(rawValue: array[0]) ?? .unknown
        array.removeFirst()
        
        // Size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // Name Length - 1 byte
        nameLength = array[0]
        array.removeFirst()
//TODO: check size of data before continuing
        
        // Name - UTF8
        let nameRange = 0..<Int(nameLength)
        guard let str = String(bytes: array[nameRange], encoding: .utf8) else {
            throw PacketError.cannotCreateStringForName
        }
        name = str
        array.removeSubrange(nameRange)
        
        // Timestamp - 4 bytes
        if type == .trackableWithTimestamp {
            timestamp = try integerWithBytes([array[0], array[1], array[2], array[3]])
            array.removeSubrange(0...3)
        }
        else {
            timestamp = 0
        }
        
        // Number of packet modules - 1 byte
        modCount = array[0]
        array.removeFirst()
        
        //
    }
    
    
    

    
    func print() {
       logging("==================Trackable Module==================", shiftRight: 2)
        
        logging("Size: \(size)", shiftRight: 2)
        logging("Packet Name Length: \(nameLength)", shiftRight: 2)
        logging("Name: \(name)", shiftRight: 2)
        logging("Number of Modules: \(modCount)", shiftRight: 2)
        
        if type == .trackableWithTimestamp {logging("Timestamp: ", shiftRight: 2)}
        
        logging("==================Trackable Module==================", shiftRight: 2)
    }
}





struct CentroidMod: Packet {
    // Packet
    let type: RTTrP_PacketModules = .centroidPosition
    
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
    let type: RTTrP_PacketModules
    
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
    let type: RTTrP_PacketModules = .orientationQuaternion
    
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
    let type: RTTrP_PacketModules = .orientationEuler
    
    // EulerModule
    let size: uint16
    let latency: uint16
    let order: uint16
    let r1, r2, r3: Double
    
    
    func print() {
        Swift.print("==================Euler Module==================")
        
        Swift.print("Module Size: \(size)")
        Swift.print("Latency: \(latency)")
        Swift.print("Euler Order: \(order)")
        Swift.print("R1: \(r1)")
        Swift.print("R2: \(r2)")
        Swift.print("R3: \(r3)")
        
        Swift.print("==================Euler Module==================")
    }
}





struct CentroidAccVelMod: Packet {
    // Packet
    let type: RTTrP_PacketModules = .centroidAccVel
    
    // CentroidAccVelMod
    let size: uint16
    let coor: Coordinates<Double>
    let acc: Coordinates<Float>
    let vel: Coordinates<Float>
    
    
    func print() {
        Swift.print("======Centroid Acceleration/Velocity Module======")
        
        Swift.print("Module Size: \(size)")
        
        Swift.print("X Position: \(coor.x)")
        Swift.print("Y Position: \(coor.y)")
        Swift.print("Z Position: \(coor.z)")
        
        Swift.print("X Velocity: \(vel.x)")
        Swift.print("Y Velocity: \(vel.y)")
        Swift.print("Z Velocity: \(vel.z)")
        
        Swift.print("X Acceleration: \(acc.x)")
        Swift.print("Y Acceleration: \(acc.y)")
        Swift.print("Z Acceleration: \(acc.z)")
        
        Swift.print("======Centroid Acceleration/Velocity Module======")
    }
}





struct LEDAccVelMod: Packet {
    // Packet
    let type: RTTrP_PacketModules
    
    // LEDAccVelMod
    let size: uint16
    let index: uint8
    let coor: Coordinates<Double>
    let acc: Coordinates<Float>
    let vel: Coordinates<Float>
    
    
    func print() {
        Swift.print("========LED Acceleration/Velocity Module========")
        
        Swift.print("Module Size: \(size)")
        
        Swift.print("X Position: \(coor.x)")
        Swift.print("Y Position: \(coor.y)")
        Swift.print("Z Position: \(coor.z)")
        
        Swift.print("X Velocity: \(vel.x)")
        Swift.print("Y Velocity: \(vel.y)")
        Swift.print("Z Velocity: \(vel.z)")
        
        Swift.print("X Acceleration: \(acc.x)")
        Swift.print("Y Acceleration: \(acc.y)")
        Swift.print("Z Acceleration: \(acc.z)")
        
        Swift.print("========LED Acceleration/Velocity Module========")
    }
}
