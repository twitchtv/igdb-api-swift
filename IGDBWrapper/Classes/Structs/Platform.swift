//
//  platform.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

// can be found in GameEngine
//public struct Logo: Codable {
//    var url: String?
//    var cloudinary_id: String?
//    var width: Int64?
//    var height: Int64?
//   }

public struct Manufacturer: Codable {
    var company: Int64?
    var comment: String?
   }

public struct Developer: Codable {
    var company: Int64?
    var comment: String?
   }

// Can be found in Game
//public struct ReleaseDate: Codable {
//    var date: Int64?
//    var region: Int64?
//   }

public struct Version: Codable {
    var name: String?
    var slug: String?
    var url: String?
    var summary: String?
    var manufacturer: Int64?
    var os: String?
    var cpu: String?
    var storage: String?
    var memory: String?
    var graphics: String?
    var sound: String?
    var online: String?
    var media: String?
    var connectivity: String?
    var resolutions: String?
    var output: String?
    var manufacturers: [Manufacturer]?
    var developers: [Developer]?
    var logo: Logo?
    var release_dates: [ReleaseDate]?
   }

public struct Platform: Codable {
    var id: UInt64?
    var name: String?
    var logo: Logo?
    var slug: String?
    var url: String?
    var created_at: Int64?
    var updated_at: Int64?
    var shortcut: String?
    var website: String?
    var summary: String?
    var category: Int64?
    var product_family: Int64?
    var alternative_name: String?
    var generation: Int64?
    var games: [ObjectType<Game>]?
    var versions: [Version]?
    var _score: Float64?
    var error: [String]?
}

