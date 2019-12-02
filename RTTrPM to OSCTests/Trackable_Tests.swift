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
            
                                32, 0, 51, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 0, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 1, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 2]

    
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





extension Trackable_Tests {
    
    func testTrackable() {
        XCTAssertNotNil(trackable)
    }
    
    
    func testTrackable_type() {
        XCTAssertEqual(trackable?.type, .trackable)
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
