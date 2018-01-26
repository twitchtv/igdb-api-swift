//
//  company.swift
//
//  Created by Filip Husnjak on 2018-01-22.
//  Copyright © 2018 igdb. All rights reserved.
//

import Foundation

public struct Company: Codable {
    public var id: UInt64?
    public var name: String?
    public var created_at: Int64?
    public var updated_at: Int64?
    public var slug: String?
    public var url: String?
    public var logo: Logo?
    public var description: String?
    public var start_date: Int64?
    public var start_date_category: Int64?
    public var country: Int64?
    public var website: String?
    public var parent: Int64?
    public var changed_company_id: Int64?
    public var change_date: Int64?
    public var change_date_category: Int64?
    public var twitter: String?
    public var facebook: String?
    public var publiclished: [ObjectType<Game>]?
    public var developed: [ObjectType<Game>]?
    public var _score: Float64?
    public var error:  [String]?
    
    public init() {}
}

