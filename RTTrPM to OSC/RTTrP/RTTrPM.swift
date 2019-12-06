//
//  RTTrPM.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation





enum RTTrPM_Error: Error {
    case badModuleType(_ type: RTTrP_PacketModules)
}





enum RTTrP_PacketModules: UInt8 {
    case trackedPoint = 0x01
    case trackableWithTimestamp = 0x51
    case centroidPosition = 0x02
    case orientationQuaternion = 0x03
    case orientationEuler = 0x04
    case trackedPointPosition = 0x06
    case centroidAccVel = 0x20
    case trackedPointAccVel = 0x21
    case zoneCollisionDetection = 0x22
    
    case unknown = 0xFF
}





struct RTTrPM {
    var trackable: Trackable?
    
    
    init(_ array: inout [UInt8]) throws {
        let module = RTTrP_PacketModules(rawValue: array[0]) ?? .unknown
        
        switch module {
        case .trackedPoint, .trackableWithTimestamp:
            trackable = try Trackable(&array)
        default:
            throw RTTrPM_Error.badModuleType(module)
        }
    }
}


extension RTTrPM {
    func print() {
        if trackable != nil         {trackable!.print()}
    }
}
