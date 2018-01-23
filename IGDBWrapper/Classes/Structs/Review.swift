//
//  Review.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Review: Codable {
    var id: UInt64?
    var created_at: Int64?
    var updated_at: Int64?
    var username: String?
    var slug: String?
    var url: String?
    var title: String?
    var game: ObjectType<Game>?
    var category: Int64?
    var likes: Int64?
    var views: Int64?
    var rating_category: Int64?
    var platform: Int64?
    var video: String?
    var introduction: String?
    var content: String?
    var conclusion: String?
    var positive_points: String?
    var negative_points: String?
    var _score: Float64?
    var error: [String]?
}
