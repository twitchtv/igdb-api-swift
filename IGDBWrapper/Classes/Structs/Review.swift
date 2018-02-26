//
//  Review.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Review: Codable {
    public var id: UInt64?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var username: String?
    public var slug: String?
    public var url: String?
    public var title: String?
    public var game: ObjectType<Game>?
    public var avatar_url: String?
    public var review_rating: Int?
    public var story_rate: Int?
    public var graphics_rate: Int?
    public var audio_rate: Int?
    public var controls_rate: Int?
    public var fun_rate: Int?
    public var category: Int64?
    public var likes: Int64?
    public var views: Int64?
    public var rating_category: Int64?
    public var platform: Int64?
    public var video: String?
    public var introduction: String?
    public var content: String?
    public var conclusion: String?
    public var positive_points: String?
    public var negative_points: String?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
