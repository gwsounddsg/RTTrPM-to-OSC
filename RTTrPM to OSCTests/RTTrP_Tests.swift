import XCTest
@testable import RTTrPM_to_OSC




class RTTrP_Tests: XCTestCase {
    
    let rttData: [UInt8] =   // intSig
                            [65, 84,
                            // fltSig
                            52, 67,
                            // version
                            0, 2,
                            // packet id
                            0, 0, 0, 1,
                            // packet format
                            0,
                            // size
                            0, 231,
                            // context
                            255, 255, 255, 255,
                            // number of modules
                            1,
                            
                            
                            1, 0, 213, 1, 48, 4, 32, 0, 51, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 0, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 1, 33, 0, 52, 6, 128, 32, 245, 221, 147, 35, 64, 0, 0, 0, 0, 0, 0, 0, 0, 74, 178, 220, 252, 105, 132, 0, 64, 122, 73, 219, 194, 0, 0, 0, 0, 237, 167, 84, 194, 7, 196, 244, 64, 0, 0, 0, 0, 180, 84, 12, 194, 2]
    
    var rttrp: RTTrP?

    
    override func setUp() {
        do {
            rttrp = try RTTrP(data: rttData)
        }
        catch {
            XCTAssertThrowsError(error.localizedDescription)
        }
    }

    
    override func tearDown() {
        
    }
}




//MARK: - RTTrP
extension RTTrP_Tests {
    
    func testRTTrP() {
        XCTAssertNotNil(rttrp)
    }
    
    
    func testRTTrP_intSig() {
        XCTAssertEqual(rttrp?.intSig, .bigEndian)
    }
    
    
    func testRTTrP_fltSig() {
        XCTAssertEqual(rttrp?.fltSig, .littleEndianPM)
    }
    
    
    func testRTTrP_version() {
        XCTAssertEqual(rttrp?.version, 2)
    }
    
    
    func testRTTrP_packetID() {
        XCTAssertEqual(rttrp?.packetID, 1)
    }
    
    
    func testRTTrP_packetFormat() {
        XCTAssertEqual(rttrp?.packetFormat, .raw)
    }
    
    
    func testRTTrP_size() {
        XCTAssertEqual(rttrp?.size, 231)
    }
    
    
    func testRTTrP_context() {
        XCTAssertEqual(rttrp?.context, UInt32.max)
    }
    
    
    func testRTTrP_modCount() {
        XCTAssertEqual(rttrp?.modCount, 1)
    }
}
