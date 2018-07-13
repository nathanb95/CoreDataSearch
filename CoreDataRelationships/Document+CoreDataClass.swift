//
//  Document+CoreDataClass.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/13/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        } set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, body: String?, date: Date?, size: Int64) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Document.entity(), insertInto: context)
        
        self.name = name
        self.body = body
        self.date = date
        self.size = size
    }
}
