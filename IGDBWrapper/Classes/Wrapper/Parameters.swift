//
//  Parameters.swift
//  Lets users build queries for the wrapper
//
//  Created by Filip on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import Foundation
import Dispatch

public class Parameters {
    
    var offset: String = ""
    var ids: String = ""
    var fields: String = ""
    var expand: String = ""
    var limit: String = ""
    var order: String = ""
    var search: String = ""
    var scroll: String = ""
    var query: String = ""
    
    var filters: [String] = []
    
    public init() {}
    
    public func add(filter: String) -> Parameters {
        filters.append("&filter\(filter.replacingOccurrences(of: " ", with: ""))")
        return self
    }
    
   public  func add(ids: String) -> Parameters {
        self.ids = ids.replacingOccurrences(of: " ", with: "")
        return self
    }
    
    public func add(offset: String) -> Parameters {
        self.offset = "&offset=\(offset.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    public func add(fields: String) -> Parameters {
        self.fields = fields.replacingOccurrences(of: " ", with: "")
        return self
    }
    
    public func add(expand: String) -> Parameters {
        self.expand = "&expand=\(expand.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    public func add(limit: String) -> Parameters {
        self.limit = "&limit=\(limit.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    public func add(order: String) -> Parameters {
        self.order = "&order=\(order.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    public func add(search: String) -> Parameters {
        self.search = "?search=\(search)"
        return self
    }
    
    public func add(scroll: String) -> Parameters {
        self.scroll = "&scroll=\(scroll.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    public func buildQuery(endpoint: Endpoint) -> String {
        var filter: String = ""
        
        for param in filters {
            filter += param
        }
        
        query = endpoint.rawValue.lowercased()
        query += "/" + ids + search
        
        if fields != "" && search != "" {
            query += "&fields=" + fields
        }else if !fields.isEmpty {
            query += "?fields=" + fields
        }else{
            query += "?fields=*"
        }
        
        query += filter + expand + order + limit + offset + scroll
                
        return query
    }
    
}

