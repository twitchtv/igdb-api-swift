//
//  ObjectType.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

extension ObjectType{
    enum CodingError: Error {
        case decoding(String)
    }
    enum CodableKeys: String, CodingKey {
        case Struct, Id
    }
}

/**
    ObjectType keeps track of struct expansion with two different 'states'
    Struct OR Int64
    If the request is expanded then the ObjectType will be a struct of that type. Otherwise it will be the id
 
    @param T the struct type it should expand to, if expanded.
 */
public indirect enum ObjectType<T: Codable>: Codable {
    case Struct(T)
    case Id(Int64)
    
    // decodes the response to the correct 'state', Struct or Int64.
    public init(from decoder: Decoder) throws {
        let values = try decoder.singleValueContainer()
        
        if let standardID = try? values.decode(Int64.self) {
            self = .Id(standardID)
        } else if let extendedID = try? values.decode(T.self) {
            self = .Struct(extendedID)
        } else {
            throw CodingError.decoding("Decoding Failed \(dump(values))")
        }
    }
    
    // encodes the response to the correct 'state', Struct or Int64.
    public func encode(to encoder: Encoder) throws {
        
        switch self {
        case let .Struct(extendedID):
            try extendedID.encode(to: encoder)
        case let .Id(standardID):
            try standardID.encode(to: encoder)
        }
    }
    
    // Converts the ObjectType to the expanded stuct, If the response is expanded.
    public func expand() -> T? {
        if case let .Struct(obj) = self {
            return obj
        }
        return nil
    }
    
    // Checks if the ObjectType is expandable.
    public func isExpanded() -> Bool {
        if case  .Struct(_) = self {
            return true
        }
        return false
    }
    
    // Converts the ObjectType to the unexpanded Int64, If the response is not expanded.
    public func id() -> Int64? {
        if case let .Id(value) = self {
            return value
        }
        return nil
    }
}
