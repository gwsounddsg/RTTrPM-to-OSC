//
//  RTTrP.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation




class RTTrP {
    let headerInt: uint16
    let headerFloat: uint16
    let version: uint16
    let packetID: uint32
    let packetFormat: uint8
    let size: uint16
    let context: uint32
    let modCount: uint8
    let data: [CUnsignedChar]
    
    
    init(intHeader: uint16, fltHeader: uint16, version: uint16, pID: uint32, pForm: uint8, pktSize: uint16, context: uint32, numMods: uint8, data: [CUnsignedChar]) {
        self.headerInt = intHeader
        self.headerFloat = fltHeader
        self.version = version
        self.packetID = pID
        self.packetFormat = pForm
        self.size = pktSize
        self.context = context
        self.modCount = numMods
        self.data = data
    }
}


extension RTTrP {
    func printHeader() {
        
    }
}
