//
//  game_mode.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct GameMode: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var slug: String?
    public var url: String?
    public var games: [ObjectType<Game>]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}


