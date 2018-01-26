//
//  Person.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Person: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var slug: String?
    public var url: String?
    public var dob: Int64?
    public var gender: Int64?
    public var country: Int64?
    public var mug_shot: MugShot?
    public var bio: String?
    public var description: String?
    public var parent: Int64?
    public var homepage: String?
    public var twitter: String?
    public var linkedin: String?
    public var google_plus: String?
    public var facebook: String?
    public var instagram: String?
    public var tumblr: String?
    public var soundcloud: String?
    public var pinterest: String?
    public var youtube: String?
    public var nicknames: [String]?
    public var loves_count: Int64?
    public var voice_acted: [Int64]?
    public var games: [ObjectType<Game>]?
    public var characters: [ObjectType<Character>]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
