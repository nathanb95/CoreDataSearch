//
//  Document+CoreDataProperties.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/13/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//
//

import Foundation
import CoreData


extension Document {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document> {
        return NSFetchRequest<Document>(entityName: "Document")
    }

    @NSManaged public var name: String?
    @NSManaged public var body: String?
    @NSManaged public var rawDate: NSDate?
    @NSManaged public var size: Int64
    @NSManaged public var category: Category?

}
