//
//  Globals.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/8/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation


protocol HexConverter: BinaryInteger {}
extension uint8: HexConverter {}
extension uint16: HexConverter {}
extension uint32: HexConverter {}

/// inserts a print of a UInt8, UInt16, or UInt32 in hex for (eg: 0x3F5B)
func printHex<T: HexConverter>(_ num: T) {
    let str = String(num, radix: 16, uppercase: true)
    print("0x\(str)", terminator: "")
}





let testdebug = true
func logging(_ msg: String, shiftRight: Int = 0) {
    if testdebug {
        var shift = shiftRight
        while shift > 0 {
            print("|\t", terminator: "")
            shift -= 1
        }
        print(msg)
    }
}





enum GWErr: Error {
    case badByteCountForReturnType
}

/**
 - This function takes in an array of UInt8's and returns a single integer combining the array.
 - Example result from [0x00, 0x00, 0x00, 0x01] == UInt32(1), [0xFF, 0xFF] == UInt16(65535)
 - Returns optional because you could pass only 3 bytes for a UInt32 which wouldn't work
 
 ## Usage
 - let val: UInt32? = integerWithBytes([0x32, 0x51, 0x00, 0x09])
 
 - Parameter bytes: Any array of UIn8's
*/
func integerWithBytes<T: BinaryInteger> (_ bytes: [UInt8]) throws -> T {
    if bytes.count != MemoryLayout<T>.size {throw GWErr.badByteCountForReturnType}
    
    var result: T = 0
    for byte in bytes {
        result = result << 8 | T(byte)
    }
    
    return result
}


extension FloatingPoint {
    
    init(_ bytes: [UInt8]) throws {
        
        guard bytes.count == MemoryLayout<Self>.size else {throw GWErr.badByteCountForReturnType}
        
        self = bytes.withUnsafeBytes {
            
            return $0.load(fromByteOffset: 0, as: Self.self)
        }
    }
}





let packetEG: [UInt8] = [65, 84, 52, 67, 0, 2, 0, 0, 0, 1, 0, 0, 231, 255, 255, 255, 255, 1, 1, 0, 213, 1, 48, 4, 32, 0, 51, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 0, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 1, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 2]





extension Double {
    func roundTo(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Float {
    func roundTo(_ places: Int) -> Float {
        let divisor = powf(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
