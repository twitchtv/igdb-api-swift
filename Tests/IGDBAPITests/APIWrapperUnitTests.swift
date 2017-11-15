//
//  APIWrapperUnitTests.swift
//  APIWrapperUnitTests
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import XCTest

@testable import IGDBAPI

class APIWrapperUnitTests: XCTestCase, WrapperTestCallback {
    
    var wrapper: APIWrapper? = nil
    var theExpectation: XCTestExpectation?
    var testCallback: WrapperTestCallback?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let API_KEY = ProcessInfo.processInfo.environment["API_KEY"]
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
    
    func testSearch(){
        let params = Parameters()
            .add(search: "mass effect")
            .add(fields: "name,url")
        
        theExpectation = expectation(description: "initialized")
        testCallback = self
        wrapper?.search(endpoint: .GAMES, params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            
            let result = jsonResponse[0]
            
            let name = result["name"] as? String
            let url = result["url"] as? String
            
            XCTAssertEqual(url, "https://www.igdb.com/games/mass-effect")
            XCTAssertEqual(name, "Mass Effect")
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testGames(){
        let params = Parameters().add(ids: "12356")
        
        theExpectation = expectation(description: "initialized")
        testCallback = self
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let slug = result["slug"] as? String
            
            XCTAssertEqual(slug, "3d-quasars")
            
            self.testCallback?.onDone(results: "finished")
        },  onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
}

protocol WrapperTestCallback{
    func onDone(results: String)
}
