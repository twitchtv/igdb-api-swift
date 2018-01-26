//
//  Feed.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct FeedVideo: Codable {
    public var name: String?
    public var video_id: String?
    
    public init() {}
}

public struct Feed: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var published_at: Int64?
    public var slug: String?
    public var url: String?
    public var title: String?
    public var content: String?
    public var user: Int64?
    public var games: [ObjectType<Game>]?
    public var category: Int64?
    public var feed_likes_count: Int64?
    public var feed_video: FeedVideo?
    public var pulse: ObjectType<Pulse>?
    public var uid: String?
    public var meta: String?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
