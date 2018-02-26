//
//  APIError.swift
//  IGDBWrapper
//
//  Created by Filip Husnjak on 2018-02-26.
//

import Foundation

struct APIError: LocalizedError {
    var errorDescription: String?
    var failureReason: String?
    var recoverySuggestion: String?
    var helpAnchor: String?
    // Custom vars
    var errorCode: Int?
    var error: Error?
    
    init(statusCode: Int, msg: String, error: Error) {
        errorCode = statusCode
        errorDescription = msg
        failureReason = msg
        self.error = error
        recoverySuggestion = ""
        helpAnchor = ""
    }
}
