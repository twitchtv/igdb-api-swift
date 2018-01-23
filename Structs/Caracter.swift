//
//  caracter.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct MugShot: Codable {
    var url: String?
    var cloudinary_id: String?
    var width: Int64?
    var height: Int64?
    
}

public struct Character: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var mug_shot: MugShot?
    var gender: Int64?
    var country_name: String?
    var akas: [String]?
    var species: Int64?
    var people: [Int64]?
    var games: [ObjectType<Game>]?
    var _score: Float64?
    var error: [String]?
}
