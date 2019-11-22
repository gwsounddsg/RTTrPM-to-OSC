//
//  IncomingRTTrP.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/22/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation



class Incoming {
    let port: Int
    
    
    init(port: Int = 24002) throws {
        self.port = port
    }
    
    
    init(host: String, port: Int32) throws {
        self.port = Int(port)
    }
    
    deinit {
        
    }
}
