//
//  GameStruct.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-22.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct TimeToBeat: Codable {
    var hastly: Int64?
    var normally: Int64?
    var completely: Int64?
}

public struct ReleaseDate: Codable {
    var category: Int64?
    var platform: Int64?
    var date: Int64?
    var region: Int64?
    var human: String?
    var y: Int64?
    var m: Int64?
   }

public struct AlternativeName: Codable {
    var name: String?
    var comment: String?
   }

public struct Screenshot: Codable {
    var url: String?
    var cloudinary_id: String?
    var width: Int64?
    var height: Int64?
   }

public struct Video: Codable {
    var category: Int64?
    var name: String?
    var video_id: String?
   }

public struct Cover: Codable {
    var url: String?
    var cloudinary_id: String?
    var width: Int64?
    var height: Int64?
   }

public struct Esrb: Codable {
    var synopsis: String?
    var rating: Int64?
   }

public struct Pegi: Codable {
    var synopsis: String?
    var rating: Int64?
   }

public struct Website: Codable {
    var category: Int64?
    var url: String?
   }

public struct External: Codable {
    var steam: String?
   }

public struct MultiplayerMode: Codable {
    var platform: Int64?
    var offlinecoop: Bool?
    var onlinecoop: Bool?
    var lancoop: Bool?
    var campaigncoop: Bool?
    var splitscreenonline: Bool?
    var splitscreen: Bool?
    var dropin: Bool?
    var offlinecoopmax: Int64?
    var onlinecoopmax: Int64?
    var onlinemax: Int64?
    var offlinemax: Int64?
   }

public struct Game: Codable {
    var id: UInt64?
    var name: String?
    var slug: String?
    var url: String?
    var created_at: Int64?
    var updated_at: Int64?
    var summary: String?
    var storyline: String?
    var collection: ObjectType<Collection>?
    var franchise: ObjectType<Franchise>?
    var franchises: [ObjectType<Franchise>]?
    var hypes: Int64?
    var follows: Int64?
    var rating: Float64?
    var popularity: Float64?
    var aggregated_rating: Float64?
    var aggregated_rating_count: Int64?
    var total_rating: Float64?
    var total_rating_count: Int64?
    var rating_count: Int64?
    var game: ObjectType<Game>?
    var version_parent: ObjectType<Game>?
    var version_title: String?
    var games: [ObjectType<Game>]?
    var tags: [Int64]?
    var developers: [ObjectType<Company>]?
    var publishers: [ObjectType<Company>]?
    var game_engines: [ObjectType<GameEngine>]?
    var category: Int64?
    var time_to_beat: TimeToBeat?
    var player_perspectives: [ObjectType<PlayerPerspective>]?
    var game_modes: [ObjectType<GameMode>]?
    var keywords: [ObjectType<Keyword>]?
    var themes: [ObjectType<Theme>]?
    var genres: [ObjectType<Genre>]?
    var expansions: [ObjectType<Game>]?
    var dlcs: [ObjectType<Game>]?
    var bundles: [ObjectType<Game>]?
    var standalone_expansions: [ObjectType<Game>]?
    var first_release_date: Int64?
    var status: Int64?
    var pulse_count: Int64?
    var platforms: [ObjectType<Platform>]?
    var release_dates: [ReleaseDate]?
    var alternative_names: [AlternativeName]?
    var screenshots: [Screenshot]?
    var videos: [Video]?
    var cover: Cover?
    var esrb: Esrb?
    var pegi: [Pegi]?
    var websites: [Website]?
    var external: External?
    var multiplayer_modes: [MultiplayerMode]?
    var _score: Float64?
    var error: [String]?
}
