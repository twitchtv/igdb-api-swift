//
//  Feed.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct FeedVideo: Codable {
    var name: String?
    var video_id: String?
}

public struct Feed: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var publiclished_at: Int64?
    var slug: String?
    var url: String?
    var title: String?
    var content: String?
    var user: Int64?
    var games: [ObjectType<Game>]?
    var category: Int64?
    var feed_likes_count: Int64?
    var feed_video: FeedVideo?
    var pulse: ObjectType<Pulse>
    var uid: String?
    var meta: String?
    var _score: Float64?
    var error: [String]?
}
