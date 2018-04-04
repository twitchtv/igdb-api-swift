//
//  APIError.swift
//  IGDBWrapper
//
//  Created by Filip Husnjak on 2018-02-26.
//

import Foundation

public struct APIError: LocalizedError {
    public var errorDescription: String?
    public var failureReason: String?
    public var recoverySuggestion: String?
    public var helpAnchor: String?
    // Custom vars
    public var errorCode: Int?
    public var error: Error?
    
    public init(statusCode: Int, msg: String, error: Error?) {
        errorCode = statusCode
        errorDescription = msg
        failureReason = msg
        self.error = error
        recoverySuggestion = ""
        helpAnchor = ""
    }
}
