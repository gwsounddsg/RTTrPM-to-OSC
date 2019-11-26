//
//  ViewController.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 10/29/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var incoming: Incoming?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        incoming = Incoming()
        logging("Incoming completed init!!!")
    }

    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func connect(_ sender: Any) {
        do {
            try incoming!.connect(port: 24002)
        } catch {
            logging(error.localizedDescription)
            return
        }
    }
    
    
    @IBAction func query(_ sender: Any) {
        logging("Local address: \(incoming!.localAddress())")
        logging("Local port: \(incoming!.localPort())")
    }
}

