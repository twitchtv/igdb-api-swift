//
//  Credit.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Credit: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var category: Int64?
    var game: ObjectType<Game>?
    var company: ObjectType<Company>?
    var position: Int64?
    var person: ObjectType<Person>?
    var character: ObjectType<Character>?
    var credited_name: String?
    var person_title: ObjectType<Title>?
    var country: Int64?
    var character_credited_name: String?
    var _score: Float64?
    var error: [String]?
}
