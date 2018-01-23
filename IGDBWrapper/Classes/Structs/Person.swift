//
//  Person.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Person: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var dob: Int64?
    var gender: Int64?
    var country: Int64?
    var mug_shot: MugShot?
    var bio: String?
    var description: String?
    var parent: Int64?
    var homepage: String?
    var twitter: String?
    var linkedin: String?
    var google_plus: String?
    var facebook: String?
    var instagram: String?
    var tumblr: String?
    var soundcloud: String?
    var pinterest: String?
    var youtube: String?
    var nicknames: [String]?
    var loves_count: Int64?
    var voice_acted: [Int64]?
    var games: [ObjectType<Game>]
    var characters: [ObjectType<Character>]?
    var _score: Float64?
    var error: [String]?
}
