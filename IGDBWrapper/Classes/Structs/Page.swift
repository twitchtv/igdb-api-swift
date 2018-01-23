//
//  Page.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation


public struct Background: Codable {
    var url: String?
    var cloudinary_id: String?
    var width: Int64?
    var height: Int64?
    
}

public struct Page: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var color: Int64?
    var feed: ObjectType<Feed>?
    var country: Int64?
    var page_follows_count: Int64?
    var user: Int64?
    var game: ObjectType<Game>?
    var company: Int64?
    var category: Int64?
    var sub_category: Int64?
    var description: String?
    var facebook: String?
    var twitter: String?
    var twitch: String?
    var instagram: String?
    var youtube: String?
    var steam: String?
    var linkedin: String?
    var pinterest: String?
    var soundcloud: String?
    var google_plus: String?
    var reddit: String?
    var battlenet: String?
    var origin: String?
    var uplay: String?
    var discord: String?
    var logo: Logo?
    var background: Background?
    var _score: Float64?
    var error: [String]?
}
