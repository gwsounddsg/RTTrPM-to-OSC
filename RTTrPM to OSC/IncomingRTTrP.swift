//
//  IncomingRTTrP.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/22/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Foundation
import Socket


class Incoming {
    let mysocket: Socket
    let port: Int
    
    
    init(port: Int = 24002) throws {
        logging("Incoming Init:")
        
        self.port = port
        
        // create
        mysocket = try Socket.create(type: .datagram, proto: .udp)
        logging("created socket", shiftRight: 1)

        // set buffer size if different than default is needed
//        mysocket.readBufferSize = 32768 // default size
//        logging("set buffer size, shiftRight: 1")
        
        // listening socket
        try mysocket.listen(on: self.port)
        logging("set listening socket to port \(self.port)", shiftRight: 1)
    }
    
    
    init(host: String, port: Int32) throws {
        logging("Incomming host init")
        
        self.port = Int(port)
        
        // create
        mysocket = try Socket.create()
        logging("created socket", shiftRight: 1)
        
        // connect
        try mysocket.connect(to: host, port: port)
        logging("connected to host", shiftRight: 1)
    }
    
    deinit {
        mysocket.close()
    }
}
