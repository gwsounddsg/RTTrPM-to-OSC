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
