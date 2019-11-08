//
//  RTTrPM.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/7/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation



class RTTrPM {
    let header: RTTrP
    var trackable: Trackable?
    var centroidMod: CentroidMod?
    var ledModules: [LEDModule]
    var quatModule: QuatModule?
    var eulerModule: EulerModule?
    var centroidAccVelMod: CentroidAccVelMod?
    var lavMods: [LEDAccVelMod]
    
    var data: [CUnsignedChar]
    var pkType: [uint8]
    
    
    /// Inits blank RTTrPM with only the header
    init(_ header: RTTrP) {
        self.header = header
        
        ledModules = []
        lavMods = []
        data = []
        pkType = []
    }
}


extension RTTrPM {
    func print() {
        header.printHeader()
        
        if trackable != nil         {trackable!.print()}
        if centroidMod != nil       {centroidMod!.print()}
        if quatModule != nil        {quatModule!.print()}
        if eulerModule != nil       {eulerModule!.print()}
        if centroidAccVelMod != nil  {centroidAccVelMod!.print()}
        
        for mod in ledModules       {mod.print()}
        for mod in lavMods          {mod.print()}
        
        for d in data              {Swift.print(d, terminator: "")}
        Swift.print()
        
        for type in pkType          {Swift.print(type, terminator: "")}
        Swift.print()
    }
}
