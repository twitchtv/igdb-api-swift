//
//  GamesTest.swift
//  APIWrapperUnitTests
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import XCTest

@testable import IGDBAPI

class GamesTest: XCTestCase, WrapperTestCallback {
    
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
    
    func testSingleGame(){
        let params = Parameters()
            .add(ids: "1942")
        
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            let id = result["id"] as? Int
            
            XCTAssertEqual(1942, id)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleGames(){
        let params = Parameters()
            .add(ids: "27193,23212,1942")
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result1 = jsonResponse[0]
            let result2 = jsonResponse[1]
            let result3 = jsonResponse[2]
            
            let charId1 = result1["id"] as? Int
            let charId2 = result2["id"] as? Int
            let charId3 = result3["id"] as? Int
            
            XCTAssertEqual(charId1, 27193)
            XCTAssertEqual(charId2, 23212)
            XCTAssertEqual(charId3, 1942)
            self.testCallback?.onDone(results: "finished")
            
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testGamesOrder(){
        let params = Parameters()
            .add(fields: "name,popularity")
            .add(order: "popularity:desc");
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            
            var oldScore: Double = 0.0
            for var result in jsonResponse {
                let popularityScore = result["popularity"] as? Double
                if popularityScore! > oldScore && oldScore != 0.0{
                    XCTFail("BAD Ordering!")
                }
                oldScore = popularityScore!
            }
            
            XCTAssertTrue(true)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testSingleGameField(){
        let params = Parameters()
            .add(fields: "name")
            .add(ids: "42")
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            XCTAssertTrue(result.count == 2)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testMultipleGameField(){
        let params = Parameters()
            .add(fields: "name,games")
            .add(ids: "42")
        
        wrapper?.games(params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            
            XCTAssertTrue(result.count == 3)
            
            self.testCallback?.onDone(results: "finished")
        }, onError: {(Error) -> (Void) in
            XCTFail("JSONException! \(Error)")
        })
        
        // Loop until the expectation is fulfilled in onDone method
        waitForExpectations(timeout: 500, handler: {error in
            XCTAssertNil(error, "Oh, we got timeout!")
        })
    }
    
    func testGameSearchMultiAndSingle(){
        let params = Parameters()
            .add(search: "battlefield 1")
            .add(fields: "name");
        
        wrapper?.search(endpoint: .GAMES, params: params, onSuccess: {(jsonResponse: [[String: AnyObject]]) -> (Void) in
            let result = jsonResponse[0]
            let id = result["id"] as? Int
            
            XCTAssertEqual(id, 18320)
            
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
