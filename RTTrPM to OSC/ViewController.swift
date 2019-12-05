//
//  ViewController.swift
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 10/29/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    var incoming: Incoming?
    
    var localData: RTTrP? {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        incoming = Incoming()
        
        incoming?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    override var representedObject: Any? {
        didSet {
            
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
    
    
    @IBAction func genPacket(_ sender: Any) {
        if incoming == nil {return}
        
        do {
            localData = try RTTrP(data: packetEG)
            tableView.reloadData()
        }
        catch {
            logging("Error generating packet: \(error)")
        }
    }
}





extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        guard let count = localData?.modCount else {
            return 0
        }
        
        return Int(count)
    }
}





extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIDs {
        static let trackable = NSUserInterfaceItemIdentifier(rawValue: "TrackableCellID")
        static let x = NSUserInterfaceItemIdentifier(rawValue: "XCellID")
        static let y = NSUserInterfaceItemIdentifier(rawValue: "YCellID")
        static let z = NSUserInterfaceItemIdentifier(rawValue: "ZCellID")
        static let accx = NSUserInterfaceItemIdentifier(rawValue: "AccXCellID")
        static let accy = NSUserInterfaceItemIdentifier(rawValue: "AccYCellID")
        static let accz = NSUserInterfaceItemIdentifier(rawValue: "AccZCellID")
        static let velx = NSUserInterfaceItemIdentifier(rawValue: "VelXCellID")
        static let vely = NSUserInterfaceItemIdentifier(rawValue: "VelYCellID")
        static let velz = NSUserInterfaceItemIdentifier(rawValue: "VelZCellID")
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let packet = localData else {
            return nil
        }
        
        var cellID = NSUserInterfaceItemIdentifier("")
        var text = ""
        let rttrpm = packet.pmPackets[row]
        
        switch tableColumn {
        case tableView.tableColumns[0]:
            text = rttrpm.trackable?.name ?? ""
            cellID = CellIDs.trackable
        
        case tableView.tableColumns[1]:
            guard let x = rttrpm.trackable?.centroidAccVelMod?.coor.x else {return nil}
            text = String(format: "%.3f", x)
            cellID = CellIDs.x
            
        case tableView.tableColumns[2]:
            guard let y = rttrpm.trackable?.centroidAccVelMod?.coor.y else {return nil}
            text = String(format: "%.3f", y)
            cellID = CellIDs.y
            
        case tableView.tableColumns[3]:
            guard let z = rttrpm.trackable?.centroidAccVelMod?.coor.z else {return nil}
            text = String(format: "%.3f", z)
            cellID = CellIDs.z
            
        case tableView.tableColumns[4]:
            guard let accx = rttrpm.trackable?.centroidAccVelMod?.acc.x else {return nil}
            text = String(format: "%.3f", accx)
            cellID = CellIDs.accx
            
        case tableView.tableColumns[5]:
            guard let accy = rttrpm.trackable?.centroidAccVelMod?.acc.y else {return nil}
            text = String(format: "%.3f", accy)
            cellID = CellIDs.accy
            
        case tableView.tableColumns[6]:
            guard let accz = rttrpm.trackable?.centroidAccVelMod?.acc.z else {return nil}
            text = String(format: "%.3f", accz)
            cellID = CellIDs.accz
            
        case tableView.tableColumns[7]:
            guard let velx = rttrpm.trackable?.centroidAccVelMod?.vel.x else {return nil}
            text = String(format: "%.3f", velx)
            cellID = CellIDs.velx
            
        case tableView.tableColumns[8]:
            guard let vely = rttrpm.trackable?.centroidAccVelMod?.vel.y else {return nil}
            text = String(format: "%.3f", vely)
            cellID = CellIDs.vely
            
        case tableView.tableColumns[9]:
            guard let velz = rttrpm.trackable?.centroidAccVelMod?.vel.z else {return nil}
            text = String(format: "%.3f", velz)
            cellID = CellIDs.velz
            
        default:
            return nil
        }
        
        if let cell = tableView.makeView(withIdentifier: cellID, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        
        return nil
    }
}





extension ViewController: IncomingDelegate {
    
    func newPacket(_ data: RTTrP) {
        localData = data
    }
}
