//
//  AppDelegate.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 10/29/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Cocoa





@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var incoming: Incoming?
    var server: EchoServer?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        do {
            incoming = try Incoming(host: "127.0.0.1", port: 9999)
            logging("Incoming completed init!!!")

        } catch {
            print(error)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


