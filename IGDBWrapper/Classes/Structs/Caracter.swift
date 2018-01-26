//
//  caracter.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct MugShot: Codable {
    public var url: String?
    public var cloudinary_id: String?
    public var width: Int64?
    public var height: Int64?
    
    public init() {}
}

public struct Character: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var slug: String?
    public var url: String?
    public var mug_shot: MugShot?
    public var gender: Int64?
    public var country_name: String?
    public var akas: [String]?
    public var species: Int64?
    public var people: [Int64]?
    public var games: [ObjectType<Game>]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
