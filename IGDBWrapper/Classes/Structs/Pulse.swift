//
//  Pulse.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct PulseImage: Codable {
    public var url: String?
    public var cloudinary_id: String?
    public var width: Int64?
    public var height: Int64?
    
    public init() {}
}

public struct Pulse: Codable {
    public var id: UInt64?
    public var category: Int64?
    public var title: String?
    public var summary: String?
    public var image: String?
    public var url: String?
    public var uid: String?
    public var author: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var pulse_source: ObjectType<PulseSource>?
    public var published_at: Int64?
    public var ignored: Bool?
    public var videos: [Video]?
    public var pulse_image: PulseImage?
    public var tags: [Int64]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
