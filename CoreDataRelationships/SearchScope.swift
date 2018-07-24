//
//  SearchScope.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/24/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//

import Foundation

enum SearchScope: String {
    case all
    case name
    case content
    
    static var titles: [String] {
        get {
            return [SearchScope.all.rawValue, SearchScope.name.rawValue, SearchScope.content.rawValue]
        }
    }
    
    static var scopes: [SearchScope] {
        get {
            return [SearchScope.all, SearchScope.name, SearchScope.content]
        }
    }
}
