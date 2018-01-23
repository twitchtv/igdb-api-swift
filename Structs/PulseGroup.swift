//
//  PulseGroup.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct PulseGroup: Codable {
    var id: UInt64?
    var name: String?
    var category: Int64?
    var created_at: Int64?
    var updated_at: Int64?
    var published_at: Int64?
    var tags: [Int64]?
    var game: ObjectType<Game>?
    var pulses: [ObjectType<Pulse>]?
    var _score: Float64?
    var error: [String]?
}
