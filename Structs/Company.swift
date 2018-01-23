//
//  company.swift
//  main-iOS-app
//
//  Created by Filip Husnjak on 2018-01-22.
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

public struct Company: Codable {
    var id: UInt64?
    var name: String?
    var created_at: Int64?
    var updated_at: Int64?
    var slug: String?
    var url: String?
    var logo: Logo?
    var description: String?
    var start_date: Int64?
    var start_date_category: Int64?
    var country: Int64?
    var website: String?
    var parent: Int64?
    var changed_company_id: Int64?
    var change_date: Int64?
    var change_date_category: Int64?
    var twitter: String?
    var facebook: String?
    var publiclished: [ObjectType<Game>]?
    var developed: [ObjectType<Game>]?
    var _score: Float64?
    var error:  [String]?
}

