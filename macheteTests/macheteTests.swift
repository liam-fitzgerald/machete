//
//  macheteTests.swift
//  macheteTests
//
//  Created by Liam Fitzgerald on 3/6/24.
//

import XCTest
@testable import machete

final class macheteTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

final class DataModelTests: XCTestCase {
    func testBy() {
        let mdl = DataModel.shared
        let kids = mdl.children(ship: "~hastuc-dibtux", path: UPath(fromStr: "/uf-internal"))
        XCTAssertEqual(kids[0].string, "/uf-internal/general")
        XCTAssertEqual(kids[1].string, "/uf-internal/comms")
    }
}

final class SomeTests: XCTestCase {
    func testFoo() {
        
        
    }
}

final class UPathTests: XCTestCase {
    func testParse() {
        let paths = ["/foo/bar", "/", "/bar", "/foo/bar/baz"]
        paths.forEach({ path in
            let p = UPath(fromStr: path)
            XCTAssertEqual(p.string, path, "Path parsing not idempotent")
        })
    }
}
