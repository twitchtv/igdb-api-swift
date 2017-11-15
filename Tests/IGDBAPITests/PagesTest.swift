//
//  PagesTest.swift
//  APIWrapperUnitTests
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import XCTest

@testable import IGDBAPI

class PagesTest: XCTestCase, WrapperTestCallback {
    
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
    
    func testSinglePage(){
        let params = Parameters()
            .add(ids: "5")
        
        
        wrapper?.pages(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(5, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultiplePages(){
        let params = Parameters()
            .add(ids: "135,265,266")
        
        wrapper?.pages(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result1 = jsonResponse[0]
            let result2 = jsonResponse[1]
            let result3 = jsonResponse[2]
            
            let id1 = result1["id"] as? Int
            let id2 = result2["id"] as? Int
            let id3 = result3["id"] as? Int
            
            XCTAssertEqual(id1, 135)
            XCTAssertEqual(id2, 265)
            XCTAssertEqual(id3, 266)
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
