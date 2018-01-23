//
//  game_mode.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct GameMode: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var games: [ObjectType<Game>]?
    var _score: Float64?
    var error: [String]?
}


