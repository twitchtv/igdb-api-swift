//
//  GameStruct.swift
//
//  Created by Filip Husnjak on 2018-01-22.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct TimeToBeat: Codable {
    public var hastly: Int64?
    public var normally: Int64?
    public var completely: Int64?
    
    public init() {}
}

public struct ReleaseDate: Codable {
    public var category: Int64?
    public var platform: Int64?
    public var date: Int64?
    public var region: Int64?
    public var human: String?
    public var y: Int64?
    public var m: Int64?
    
    public init() {}
   }

public struct AlternativeName: Codable {
    public var name: String?
    public var comment: String?
    
    public init() {}
   }

public struct Screenshot: Codable {
    public var url: String?
    public var cloudinary_id: String?
    public var width: Int64?
    public var height: Int64?
    
    public init() {}
   }

public struct Video: Codable {
    public var category: Int64?
    public var name: String?
    public var video_id: String?
    
    public init() {}
   }

public struct Cover: Codable {
    public var url: String?
    public var cloudinary_id: String?
    public var width: Int64?
    public var height: Int64?
    
    public init() {}
   }

public struct Esrb: Codable {
    public var synopsis: String?
    public var rating: Int64?
    
    public init() {}
   }

public struct Pegi: Codable {
    public var synopsis: String?
    public var rating: Int64?
    
    public init() {}
   }

public struct Website: Codable {
    public var category: Int64?
    public var url: String?
    
    public init() {}
   }

public struct External: Codable {
    public var steam: String?
    
    public init() {}
   }

public struct MultiplayerMode: Codable {
    public var platform: Int64?
    public var offlinecoop: Bool?
    public var onlinecoop: Bool?
    public var lancoop: Bool?
    public var campaigncoop: Bool?
    public var splitscreenonline: Bool?
    public var splitscreen: Bool?
    public var dropin: Bool?
    public var offlinecoopmax: Int64?
    public var onlinecoopmax: Int64?
    public var onlinemax: Int64?
    public var offlinemax: Int64?
    
    public init() {}
   }

public struct Game: Codable {
    public var id: UInt64?
    public var name: String?
    public var slug: String?
    public var url: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var summary: String?
    public var storyline: String?
    public var collection: ObjectType<Collection>?
    public var franchise: ObjectType<Franchise>?
    public var franchises: [ObjectType<Franchise>]?
    public var hypes: Int64?
    public var follows: Int64?
    public var rating: Float64?
    public var popularity: Float64?
    public var aggregated_rating: Float64?
    public var aggregated_rating_count: Int64?
    public var total_rating: Float64?
    public var total_rating_count: Int64?
    public var rating_count: Int64?
    public var game: ObjectType<Game>?
    public var version_parent: ObjectType<Game>?
    public var version_title: String?
    public var games: [ObjectType<Game>]?
    public var tags: [Int64]?
    public var developers: [ObjectType<Company>]?
    public var publishers: [ObjectType<Company>]?
    public var game_engines: [ObjectType<GameEngine>]?
    public var category: Int64?
    public var time_to_beat: TimeToBeat?
    public var player_perspectives: [ObjectType<PlayerPerspective>]?
    public var game_modes: [ObjectType<GameMode>]?
    public var keywords: [ObjectType<Keyword>]?
    public var themes: [ObjectType<Theme>]?
    public var genres: [ObjectType<Genre>]?
    public var expansions: [ObjectType<Game>]?
    public var dlcs: [ObjectType<Game>]?
    public var bundles: [ObjectType<Game>]?
    public var standalone_expansions: [ObjectType<Game>]?
    public var first_release_date: Int64?
    public var status: Int64?
    public var pulse_count: Int64?
    public var platforms: [ObjectType<Platform>]?
    public var release_dates: [ReleaseDate]?
    public var alternative_names: [AlternativeName]?
    public var screenshots: [Screenshot]?
    public var videos: [Video]?
    public var cover: Cover?
    public var esrb: Esrb?
    public var pegi: Pegi?
    public var websites: [Website]?
    public var external: External?
    public var multiplayer_modes: [MultiplayerMode]?
    public var _score: Float64?
    public var error: [String]?
    
    public init() {}
}
