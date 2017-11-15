//
//  GenresTest.swift
//  APIWrapperUnitTests
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import XCTest

@testable import IGDBAPI

class GenresTest: XCTestCase, WrapperTestCallback {
    
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
    
    func testSingleGenre(){
        let params = Parameters()
            .add(ids: "2")
        
        
        wrapper?.genres(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(2, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleGenres(){
        let params = Parameters()
            .add(ids: "7,5,10")
        
        wrapper?.genres(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result1 = jsonResponse[0]
            let result2 = jsonResponse[1]
            let result3 = jsonResponse[2]
            
            let charId1 = result1["id"] as? Int
            let charId2 = result2["id"] as? Int
            let charId3 = result3["id"] as? Int
            
            XCTAssertEqual(charId1, 7)
            XCTAssertEqual(charId2, 5)
            XCTAssertEqual(charId3, 10)
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
