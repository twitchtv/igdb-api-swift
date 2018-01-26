//
//  platform.swift
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Manufacturer: Codable {
    public var company: Int64?
    public var comment: String?
    
    public init() {}
   }

public struct Developer: Codable {
    public var company: Int64?
    public var comment: String?
    
    public init() {}
   }

public struct Version: Codable {
    public var name: String?
    public var slug: String?
    public var url: String?
    public var summary: String?
    public var manufacturer: Int64?
    public var os: String?
    public var cpu: String?
    public var storage: String?
    public var memory: String?
    public var graphics: String?
    public var sound: String?
    public var online: String?
    public var media: String?
    public var connectivity: String?
    public var resolutions: String?
    public var output: String?
    public var manufacturers: [Manufacturer]?
    public var developers: [Developer]?
    public var logo: Logo?
    public var release_dates: [ReleaseDate]?
    
    public init() {}
   }

public struct Platform: Codable {
    public var id: UInt64?
    public var name: String?
    public var logo: Logo?
    public var slug: String?
    public var url: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var shortcut: String?
    public var website: String?
    public var summary: String?
    public var category: Int64?
    public var product_family: Int64?
    public var alternative_name: String?
    public var generation: Int64?
    public var games: [ObjectType<Game>]?
    public var versions: [Version]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}

