//
//  ReleaseDatesTest.swift
//  APIWrapperUnitTests
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import XCTest

@testable import IGDBAPI

class ReleaseDatesTest: XCTestCase, WrapperTestCallback {
    
    var wrapper: APIWrapper? = nil
    var theExpectation: XCTestExpectation?
    var testCallback: WrapperTestCallback?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let API_KEY =  ProcessInfo.processInfo.environment["API_KEY"]
        theExpectation = expectation(description: "Initialized")
        testCallback = self
        print(API_KEY!)
        wrapper = APIWrapper(API_KEY: API_KEY!)
    }
    
    func onDone(results: String) {
        theExpectation?.fulfill() // This will release our timer
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        wrapper = nil
    }
    
    func testSingleRelesseDate(){
        let params = Parameters()
            .add(ids: "86653")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(86653, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleReleaseDates(){
        let params = Parameters()
            .add(ids: "86660,86663,15683")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result1 = jsonResponse[0]
            let result2 = jsonResponse[1]
            let result3 = jsonResponse[2]
            
            let id1 = result1["id"] as? Int
            let id2 = result2["id"] as? Int
            let id3 = result3["id"] as? Int
            
            XCTAssertEqual(id1, 86660)
            XCTAssertEqual(id2, 86663)
            XCTAssertEqual(id3, 15683)
            self.testCallback?.onDone(results: "finished")
            
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testSingleFiltersReleaseDates(){
        let params = Parameters()
            .add(filter: "[platform][eq]=48")
            .add(fields: "game")
            .add(order: "date:asc")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(44949, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleFiltersReleaseDates(){
        let params = Parameters()
            .add(filter: "[platform][eq]=48")
            .add(filter: "[date][gt]=1501586921000")
            .add(fields: "game")
            .add(order: "date:asc")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(116997, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testSingleExpander(){
        let params = Parameters()
            .add(ids: "86653")
            .add(expand: "game")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let game = result["game"] as? [String: AnyObject]
            let gameId = game!["id"] as? Int
            
            XCTAssertEqual(38722, gameId)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleExpander(){
        let params = Parameters()
            .add(ids: "86653")
            .add(expand: "game,platform")
        
        wrapper?.releaseDates(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let game = result["game"] as? [String: AnyObject]
            let platform = result["platform"] as? [String: AnyObject]
            
            let gameId = game!["id"] as? Int
            let platformId = platform!["id"] as? Int
            
            XCTAssertEqual(38722, gameId)
            XCTAssertEqual(34, platformId)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
}
