import XCTest
@testable import RTTrPM_to_OSC





class Trackable_Tests: XCTestCase {

    let rttData: [UInt8] =   // RTTrP
                            [65, 84, 52, 67, 0, 2, 0, 0, 0, 1, 0, 0, 231, 255, 255, 255, 255, 1,
                            // RTTrPM
                            // type (Trackable without Timestamp)
                            1,
                            // size
                            0, 213,
                            // name length
                            1,
                            // name
                            48,
                            // number of packet modules
                            4,
        
                            // CentroidAccVel
                            // type
                            32,
                            // size
                            0, 51,
                            // Coordinates
                            6, 128, 32, 245, 221, 147, 35, 64,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            74, 178, 220, 252, 105, 132, 0, 64,
                            // Acceleration
                            122, 73, 219, 194,
                            0, 0, 0, 0,
                            237, 167, 84, 194,
                            // Velocity
                            7, 196, 244, 64,
                            0, 0, 0, 0,
                            180, 84, 12, 194,
                            
                            // TrackedPointAccVel
                            // type
                            33,
                            // size
                            0, 52,
                            // Coordinates
                            6, 128, 32, 245, 221, 147, 35, 64,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            74, 178, 220, 252, 105, 132, 0, 64,
                            // Acceleration
                            122, 73, 219, 194,
                            0, 0, 0, 0,
                            237, 167, 84, 194,
                            // Velocity
                            7, 196, 244, 64,
                            0, 0, 0, 0,
                            180, 84, 12, 194,
                            // index
                            0,
                            
                            // TrackedPointAccVel
                            33,
                            0, 52,
                            6, 128, 32, 245, 221, 147, 35, 64,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            74, 178, 220, 252, 105, 132, 0, 64,
                            122, 73, 219, 194,
                            0, 0, 0, 0,
                            237, 167, 84, 194,
                            7, 196, 244, 64,
                            0, 0, 0, 0,
                            180, 84, 12, 194,
                            1,
                            
                            // TrackedPointAccVel
                            33,
                            0, 52,
                            6, 128, 32, 245, 221, 147, 35, 64,
                            0, 0, 0, 0, 0, 0, 0, 0,
                            74, 178, 220, 252, 105, 132, 0, 64,
                            122, 73, 219, 194,
                            0, 0, 0, 0,
                            237, 167, 84, 194,
                            7, 196, 244, 64,
                            0, 0, 0, 0,
                            180, 84, 12, 194,
                            2]

    
    var trackable: Trackable?
    
    
    override func setUp() {
        do {
            let rttrp = try RTTrP(data: rttData)
            trackable = rttrp.pmPackets[0].trackable
        }
        catch {
            // error caught in RTTrP_Tests
        }
    }
}




//MARK: - First trackable module
extension Trackable_Tests {
    
    func testTrackable() {
        XCTAssertNotNil(trackable)
    }
    
    
    func testTrackable_type() {
        XCTAssertEqual(trackable?.type, .trackedPoint)
    }
    
    
    func testTrackable_size() {
        XCTAssertEqual(trackable?.size, 213)
    }
    
    
    func testTrackable_nameLength() {
        XCTAssertEqual(trackable?.nameLength, 1)
    }
    
    
    func testTrackable_name() {
        XCTAssertEqual(trackable?.name, "0")
    }
    
    
    func testTrackable_timestamp() {
        XCTAssertEqual(trackable?.timestamp, 0) // no timestamp for this type
    }
    
    
    func testTrackable_modCount() {
        XCTAssertEqual(trackable?.modCount, 4)
    }
}





//MARK: - First sub-module CentroidAccVel
extension Trackable_Tests {
    
    func testTrackableCentroidAccVel() {
        XCTAssertNotNil(centroidAccVel())
    }
    
    
    func testTrackableCentroidAccVel_size() {
        XCTAssertEqual(centroidAccVel()?.size, 51)
    }
    
    
    func testTrackableCentroidAccVel_x() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.coor.x, 9.788, accuracy: 0.001)
    }
    
    
    func testTrackableCentroidAccVel_y() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()?.coor.y, 0.0)
    }
    
    
    func testTrackableCentroidAccVel_z() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.coor.z, 2.064, accuracy: 0.001)
    }
    
    
    func testTrackableCentroidAccVel_accx() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.acc.x, -109.643, accuracy: 0.001)
    }
    
    
    func testTrackableCentroidAccVel_accy() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()?.acc.y, 0.0)
    }
    
    
    func testTrackableCentroidAccVel_accz() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.acc.z, -53.164, accuracy: 0.001)
    }
    
    
    func testTrackableCentroidAccVel_velx() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.vel.x, 7.649, accuracy: 0.001)
    }
    
    
    func testTrackableCentroidAccVel_vely() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()?.vel.y, 0.0)
    }
    
    
    func testTrackableCentroidAccVel_velz() {
        if centroidAccVel() == nil {return}
        XCTAssertEqual(centroidAccVel()!.vel.z, -35.083, accuracy: 0.001)
    }
}





//MARK: - TrackedPointAccVel
extension Trackable_Tests {
    
    func testTrackableTrackedPointAccVel() {
        XCTAssertNotNil(trackedPointAccVel(0))
        XCTAssertNotNil(trackedPointAccVel(1))
        XCTAssertNotNil(trackedPointAccVel(2))
    }
    
    
    func testTrackableTrackedPointAccVelCount() {
        XCTAssertEqual(trackable?.trackedPointAccVelMods.count, 3)
    }
    
    
    func testTrackableTrackedPointAccVel_size() {
        XCTAssertEqual(trackedPointAccVel(0)?.size, 52)
        XCTAssertEqual(trackedPointAccVel(1)?.size, 52)
        XCTAssertEqual(trackedPointAccVel(2)?.size, 52)
    }
    
    
    func testTrackableTrackedPointAccVel_x() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.coor.x, 9.7888, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.coor.x, 9.7888, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.coor.x, 9.7888, accuracy: 0.001)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_y() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.coor.y, 0.0)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.coor.y, 0.0)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.coor.y, 0.0)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_z() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.coor.z, 2.064, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.coor.z, 2.064, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.coor.z, 2.064, accuracy: 0.001)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_accx() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.acc.x, -109.643, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.acc.x, -109.643, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.acc.x, -109.643, accuracy: 0.001)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_accy() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.acc.y, 0.0)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.acc.y, 0.0)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.acc.y, 0.0)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_accz() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.acc.z, -53.164, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.acc.z, -53.164, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.acc.z, -53.164, accuracy: 0.001)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_velx() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.vel.x, 7.649, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.vel.x, 7.649, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.vel.x, 7.649, accuracy: 0.001)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_vely() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.vel.y, 0.0)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.vel.y, 0.0)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.vel.y, 0.0)
        }
    }
    
    
    func testTrackableTrackedPointAccVel_velz() {
        if trackedPointAccVel(0) != nil {
            XCTAssertEqual(trackedPointAccVel(0)!.vel.z, -35.083, accuracy: 0.001)
        }
        if trackedPointAccVel(1) != nil {
            XCTAssertEqual(trackedPointAccVel(1)!.vel.z, -35.083, accuracy: 0.001)
        }
        if trackedPointAccVel(2) != nil {
            XCTAssertEqual(trackedPointAccVel(2)!.vel.z, -35.083, accuracy: 0.001)
        }
    }
}





//MARK: - Utility
extension Trackable_Tests {
    
    func centroidAccVel() -> CentroidAccVelMod? {
        return trackable?.centroidAccVelMod
    }
    
    
    func trackedPointAccVel(_ index: Int) -> TrackedPointAccVelMod? {
        return trackable?.trackedPointAccVelMods[index]
    }
}
