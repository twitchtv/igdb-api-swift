//
//  Credit.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Credit: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var category: Int64?
    public var game: ObjectType<Game>?
    public var company: ObjectType<Company>?
    public var position: Int64?
    public var person: ObjectType<Person>?
    public var character: ObjectType<Character>?
    public var credited_name: String?
    public var person_title: ObjectType<Title>?
    public var country: Int64?
    public var character_credited_name: String?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
