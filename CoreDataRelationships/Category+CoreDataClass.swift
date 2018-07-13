//
//  Category+CoreDataClass.swift
//  CoreDataRelationships
//
//  Created by Nathaniel Banderas on 7/13/18.
//  Copyright © 2018 Nathaniel Banderas. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    var documents: [Document]? {
        return self.rawDocuments?.array as? [Document]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Category.entity(), insertInto: context)
        
        self.title = title
    }
}
