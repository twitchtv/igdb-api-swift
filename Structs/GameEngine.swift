//
//  game_engine.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

// Can be found in company
public struct Logo: Codable {
   var url: String?
   var cloudinary_id: String?
   var width: Int64?
   var height: Int64?
}

public struct GameEngine: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var logo: Logo?
    var slug: String?
    var url: String?
    var games: [ObjectType<Game>]?
    var platforms: [ObjectType<Platform>]?
    var companies: [ObjectType<Company>]?
    var _score: Float64?
    var error: [String]?
}

