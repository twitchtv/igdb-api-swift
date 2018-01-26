//
//  PulseGroup.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct PulseGroup: Codable {
    public var id: UInt64?
    public var name: String?
    public var category: Int64?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var published_at: Int64?
    public var tags: [Int64]?
    public var game: ObjectType<Game>?
    public var pulses: [ObjectType<Pulse>]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
