//
//  game_engine.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

// Can be found in company
public struct Logo: Codable {
   public var url: String?
   public var cloudinary_id: String?
   public var width: Int64?
   public var height: Int64?
    
    public init() {}
}

public struct GameEngine: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var logo: Logo?
    public var slug: String?
    public var url: String?
    public var games: [ObjectType<Game>]?
    public var platforms: [ObjectType<Platform>]?
    public var companies: [ObjectType<Company>]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}

