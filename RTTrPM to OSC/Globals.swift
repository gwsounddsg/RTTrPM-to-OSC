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
