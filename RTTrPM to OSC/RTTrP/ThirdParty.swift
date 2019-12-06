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
    
    init(_ array: inout [UInt8]) throws
    func print()
}





enum PacketError: Error {
    case cannotCreateStringForName
    case typeShouldBeTrackable
    case badUInt8Val
    
    enum ByteCountTooSmallToInit: Error {
        case trackedPoint
        case trackableWithTimestamp
        case centroidPosition
        case orientationQuaternion
        case orientationEuler
        case trackedPointPosition
        case centroidAccVel
        case trackedPointAccVel
        case zoneCollisionDetection
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
    var trackedPointMods: [TrackedPointMod] = []
    var quatModule: QuatModule?
    var eulerModule: EulerModule?
    var centroidAccVelMod: CentroidAccVelMod?
    var trackedPointAccVelMods: [TrackedPointAccVelMod] = []
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 6 {throw PacketError.ByteCountTooSmallToInit.trackedPoint}
        
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
        
        // build sub modules
        try buildSubModules(&array)
    }
    
    
    mutating func buildSubModules(_ array: inout [UInt8]) throws {
        if array.isEmpty {return}
        
        let module = RTTrP_PacketModules(rawValue: array[0]) ?? .unknown
        array.removeFirst()
        
        switch module {
        case .trackedPoint, .trackableWithTimestamp:
            return
        case .centroidAccVel:
            centroidAccVelMod = try CentroidAccVelMod(&array)
        case .trackedPointAccVel:
            trackedPointAccVelMods.append(try TrackedPointAccVelMod(&array))
        default:
            logging("Error: UInt8 value: \(array[0])", shiftRight: 2)
            throw PacketError.badUInt8Val
        }
        
        try buildSubModules(&array)
    }
    
    
    func print() {
       logging("==================Trackable Module==================", shiftRight: 2)
        
        logging("Size: \(size)", shiftRight: 2)
        logging("Packet Name Length: \(nameLength)", shiftRight: 2)
        logging("Name: \(name)", shiftRight: 2)
        logging("Number of Modules: \(modCount)", shiftRight: 2)
        
        if type == .trackableWithTimestamp {logging("Timestamp: ", shiftRight: 2)}
        
        centroidMod?.print()
        for each in trackedPointMods {each.print()}
        quatModule?.print()
        eulerModule?.print()
        centroidAccVelMod?.print()
        for each in trackedPointAccVelMods {each.print()}
        
        logging("================================", shiftRight: 2)
    }
}





struct CentroidMod: Packet {
    // Packet
    let type: RTTrP_PacketModules = .centroidPosition
    
    // Centroid
    let size: uint16
    let latency: uint16
    let coor: Coordinates<Double>
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 28 {throw PacketError.ByteCountTooSmallToInit.centroidPosition}
        
        // Size - 2 byte
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // Latency - 2 bytes
        latency = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // X - 8 bytes
        let x = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // z - 8 bytes
        let z = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // y - 8 bytes
        let y = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        coor = Coordinates<Double>(x: x, y: y, z: z)
    }
    
    
    func print() {
        logging("==================Centroid Module==================", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        logging("Latency: \(latency)", shiftRight: 3)
        logging("X Position: \(coor.x.roundTo(2))", shiftRight: 3)
        logging("Y Position: \(coor.y.roundTo(2))", shiftRight: 3)
        logging("Z Position: \(coor.z.roundTo(2))", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
    }
}





struct TrackedPointMod: Packet {
    // Packet
    let type: RTTrP_PacketModules = .trackedPoint
    
    // LEDModule
    let size: uint16
    let latency: uint16
    let coor: Coordinates<Double>
    let index: uint8
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 29 {throw PacketError.ByteCountTooSmallToInit.trackedPoint}
        
        // size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // latency - 2 bytes
        latency = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // x - 8 bytes
        let x = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // z - 8 bytes
        let z = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // y - 8 bytes
        let y = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        coor = Coordinates<Double>(x: x, y: y, z: z)
        
        // index - 1 byte
        index = array[0]
        array.removeFirst()
    }
    
    
    func print() {
        logging("==================TrackedPoint Module==================", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        logging("Latency: \(latency)", shiftRight: 3)
        logging("X Position: \(coor.x.roundTo(2))", shiftRight: 3)
        logging("Y Position: \(coor.y.roundTo(2))", shiftRight: 3)
        logging("Z Position: \(coor.z.roundTo(2))", shiftRight: 3)
        logging("LED Index: \(index)", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
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
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 36 {throw PacketError.ByteCountTooSmallToInit.orientationQuaternion}
        
        // size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // latency - 2 bytes
        latency = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // x - 8 bytes
        let x = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // z - 8 bytes
        let z = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // y - 8 bytes
        let y = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        coor = Coordinates<Double>(x: x, y: y, z: z)
        
        // w - 8 bytes
        w = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
    }
    
    
    func print() {
        logging("==================Quaternion Module==================", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        logging("Latency: \(latency)", shiftRight: 3)
        logging("Qx: \(coor.x.roundTo(2))", shiftRight: 3)
        logging("Qy: \(coor.y.roundTo(2))", shiftRight: 3)
        logging("Qz: \(coor.z.roundTo(2))", shiftRight: 3)
        logging("Qw: \(w.roundTo(2))", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
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
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 30 {throw PacketError.ByteCountTooSmallToInit.orientationEuler}
        
        // size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // latency - 2 bytes
        latency = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // order - 2 bytes
        order = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // r1 - 8 bytes
        r1 = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // r2 - 8 bytes
        r2 = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // r3 - 8 bytes
        r3 = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
    }
    
    
    func print() {
        logging("==================Euler Module==================", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        logging("Latency: \(latency)", shiftRight: 3)
        logging("Euler Order: \(order)", shiftRight: 3)
        logging("R1: \(r1.roundTo(2))", shiftRight: 3)
        logging("R2: \(r2.roundTo(2))", shiftRight: 3)
        logging("R3: \(r3.roundTo(2))", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
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
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 50 {throw PacketError.ByteCountTooSmallToInit.centroidAccVel}
        
        // size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // X - 8 bytes
        let x = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // z - 8 bytes
        let z = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // y - 8 bytes
        let y = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        coor = Coordinates<Double>(x: x, y: y, z: z)
        
        // AccX - 4 bytes
        var x2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // AccZ - 4 bytes
        var z2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // AccY - 4 bytes
        var y2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        acc = Coordinates<Float>(x: x2, y: y2, z: z2)
        
        // VelX - 4 bytes
        x2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // VelZ - 4 bytes
        z2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // VelY - 4 bytes
        y2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        vel = Coordinates<Float>(x: x2, y: y2, z: z2)
    }
    
    
    func print() {
        logging("======Centroid Acceleration/Velocity Module======", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        
        logging("X Position: \(coor.x.roundTo(2))", shiftRight: 3)
        logging("Y Position: \(coor.y.roundTo(2))", shiftRight: 3)
        logging("Z Position: \(coor.z.roundTo(2))", shiftRight: 3)
        
        logging("X Velocity: \(vel.x.roundTo(2))", shiftRight: 3)
        logging("Y Velocity: \(vel.y.roundTo(2))", shiftRight: 3)
        logging("Z Velocity: \(vel.z.roundTo(2))", shiftRight: 3)
        
        logging("X Acceleration: \(acc.x.roundTo(2))", shiftRight: 3)
        logging("Y Acceleration: \(acc.y.roundTo(2))", shiftRight: 3)
        logging("Z Acceleration: \(acc.z.roundTo(2))", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
    }
}





struct TrackedPointAccVelMod: Packet {
    // Packet
    let type: RTTrP_PacketModules = .trackedPointAccVel
    
    // LEDAccVelMod
    let size: uint16
    let index: uint8
    let coor: Coordinates<Double>
    let acc: Coordinates<Float>
    let vel: Coordinates<Float>
    
    
    init(_ array: inout [UInt8]) throws {
        if array.count < 51 {throw PacketError.ByteCountTooSmallToInit.trackedPointAccVel}
        
        // size - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // X - 8 bytes
        let x = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // z - 8 bytes
        let z = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        // y - 8 bytes
        let y = try Double([array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7]])
        array.removeSubrange(0...7)
        
        coor = Coordinates<Double>(x: x, y: y, z: z)
        
        // AccX - 4 bytes
        var x2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // AccZ - 4 bytes
        var z2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // AccY - 4 bytes
        var y2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        acc = Coordinates<Float>(x: x2, y: y2, z: z2)
        
        // VelX - 4 bytes
        x2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // VelZ - 4 bytes
        z2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // VelY - 4 bytes
        y2 = try Float([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        vel = Coordinates<Float>(x: x2, y: y2, z: z2)
        
        // index - 1 byte
        index = array[0]
        array.removeFirst()
    }
    
    
    func print() {
        logging("========TrackedPoint Acceleration/Velocity Module========", shiftRight: 3)
        
        logging("Module Size: \(size)", shiftRight: 3)
        
        logging("X Position: \(coor.x.roundTo(2))", shiftRight: 3)
        logging("Y Position: \(coor.y.roundTo(2))", shiftRight: 3)
        logging("Z Position: \(coor.z.roundTo(2))", shiftRight: 3)
        
        logging("X Velocity: \(vel.x.roundTo(2))", shiftRight: 3)
        logging("Y Velocity: \(vel.y.roundTo(2))", shiftRight: 3)
        logging("Z Velocity: \(vel.z.roundTo(2))", shiftRight: 3)
        
        logging("X Acceleration: \(acc.x.roundTo(2))", shiftRight: 3)
        logging("Y Acceleration: \(acc.y.roundTo(2))", shiftRight: 3)
        logging("Z Acceleration: \(acc.z.roundTo(2))", shiftRight: 3)
        
        logging("================================", shiftRight: 3)
    }
}
