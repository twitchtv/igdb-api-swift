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

public indirect enum ObjectType<T: Codable>: Codable {
    case Struct(T)
    case Id(Int64)
    
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
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodableKeys.self)
        
        switch self {
        case let .Struct(ExtendedID):
            try container.encode(ExtendedID, forKey: .Struct)
        case let .Id(standardID):
            try container.encode(standardID, forKey: .Id)
        }
    }
    
    public func expand() -> T? {
        if case let .Struct(obj) = self {
            return obj
        }
        return nil
    }
}
