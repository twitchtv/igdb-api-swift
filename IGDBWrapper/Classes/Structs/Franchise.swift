//
//  franchise.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-22.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Franchise: Codable {
    var id: UInt?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var games: [ObjectType<Game>]?
    var _score: Float64?
    var error: [String]?
}


