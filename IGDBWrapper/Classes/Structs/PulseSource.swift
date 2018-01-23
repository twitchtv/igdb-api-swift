//
//  PulseSource.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-23.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct PulseSource: Codable {
    var id: UInt64?
    var name: String?
    var game: ObjectType<Game>?
    var page: ObjectType<Page>?
    var _score: Float64?
    var error: [String]?
}
