//
//  Page.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation


public struct Background: Codable {
    public var url: String?
    public var cloudinary_id: String?
    public var width: Int64?
    public var height: Int64?
    
    public init() {}
}

public struct Page: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var slug: String?
    public var url: String?
    public var color: Int64?
    public var feed: ObjectType<Feed>?
    public var country: Int64?
    public var page_follows_count: Int64?
    public var user: Int64?
    public var game: ObjectType<Game>?
    public var company: Int64?
    public var category: Int64?
    public var sub_category: Int64?
    public var description: String?
    public var facebook: String?
    public var twitter: String?
    public var twitch: String?
    public var instagram: String?
    public var youtube: String?
    public var steam: String?
    public var linkedin: String?
    public var pinterest: String?
    public var soundcloud: String?
    public var google_plus: String?
    public var reddit: String?
    public var battlenet: String?
    public var origin: String?
    public var uplay: String?
    public var discord: String?
    public var logo: Logo?
    public var background: Background?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
