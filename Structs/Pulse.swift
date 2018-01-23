//
//  Pulse.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct PulseImage: Codable {
    var url: String?
    var cloudinary_id: String?
    var width: Int64?
    var height: Int64?
    
}

public struct Pulse: Codable {
    var id: UInt64?
    var category: Int64?
    var title: String?
    var summary: String?
    var image: String?
    var url: String?
    var uid: String?
    var author: String?
    var created_at: Int64?
    var updated_at: Int64?
    var pulse_source: ObjectType<PulseSource>
    var publiclished_at: Int64?
    var ignored: Bool?
    var videos: [Video]?
    var pulse_image: PulseImage?
    var tags: [Int64]?
    var _score: Float64?
    var error: [String]?
}
