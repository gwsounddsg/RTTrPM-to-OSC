//
//  RTTrP.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation




let HeaderSize = 18




enum RTTrPErr: Error {
    case dataNotLargeEnoughToInit
    case badValueFor_intSig, badValueFor_fltSig
    case badValueFor_packetFormat
}




enum RTTrP_Desc {
    enum intSig {
        case bigEndian, littleEndian
    }
    
    enum fltSig {
        case bigEndianPL, bigEndianPM, littleEndianPL, littleEndianPM
    }
    
    enum packetFormat {
        case raw, protobuf, thrift
    }
}




struct RTTrP {
    let intSig: RTTrP_Desc.intSig
    let fltSig: RTTrP_Desc.fltSig
    let version: UInt16
    let packetID: UInt32
    let packetFormat: RTTrP_Desc.packetFormat
    let size: UInt16
    let context: UInt32
    let modCount: UInt8
    var pmPackets: [RTTrPM] = []
    
    
    init(data: [UInt8]) throws {
        if data.count < HeaderSize {throw RTTrPErr.dataNotLargeEnoughToInit}
        
        var array = data
        
        // Header / Integer Signature - 2 bytes
        let headerIntSig: UInt16 = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        switch headerIntSig {
        case 0x4154:
            intSig = .bigEndian
        case 0x5441:
            intSig = .littleEndian
        default:
            throw RTTrPErr.badValueFor_intSig
        }
        
        // Header / Float Signature - 2 bytes
        let headerFltSig: UInt16 = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        switch headerFltSig {
        case 0x4434:
            fltSig = .bigEndianPL
        case 0x4334:
            fltSig = .bigEndianPM
        case 0x3444:
            fltSig = .littleEndianPL
        case 0x3443:
            fltSig = .littleEndianPM
        default:
            throw RTTrPErr.badValueFor_fltSig
        }
        
        // Header Version - 2 bytes
        version = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // Packet ID - 4 bytes
        packetID = try integerWithBytes([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // Packet Format - 1 byte
        switch array[0] {
        case 0x00:
            packetFormat = .raw
        case 0x01:
            packetFormat = .protobuf
        case 0x02:
            packetFormat = .thrift
        default:
            throw RTTrPErr.badValueFor_packetFormat
        }
        array.removeFirst()
        
        // Size of packets - 2 bytes
        size = try integerWithBytes([array[0], array[1]])
        array.removeSubrange(0...1)
        
        // Context (user definable) - 4 bytes
        context = try integerWithBytes([array[0], array[1], array[2], array[3]])
        array.removeSubrange(0...3)
        
        // Number of packet modules - 1 byte
        modCount = array[0]
        array.removeFirst()
        
        // populate trackable modules
        if fltSig == .bigEndianPM || fltSig == .littleEndianPM {
            populatePM(array)
        }
    }
}





extension RTTrP {
    
    mutating func populatePM(_ data: [UInt8]) {
        var array = data
        var counter = array.count
        
        while array.count > 0 {
            do {
                let newPM = try RTTrPM(&array)
                pmPackets.append(newPM)
                counter = array.count
            }
            catch {
                logging(error.localizedDescription, shiftRight: 1)
            }
            
            if array.count == 0 || array.count == counter {break}
        }
    }
    
    
    func printHeader() {
        if !testdebug {return}
        
        logging("======== RTTrP Packet ========")
        logging("\(intSig)", shiftRight: 1)
        logging("\(fltSig)", shiftRight: 1)
        logging("Version: \(version)", shiftRight: 1)
        logging("PacketID: \(packetID)", shiftRight: 1)
        logging("\(packetFormat)", shiftRight: 1)
        logging("Size: \(size)", shiftRight: 1)
        logging("Module Packet Count: \(modCount)", shiftRight: 1)
        
        for each in pmPackets {each.print()}
        
        print("==============================\n")
    }
}
