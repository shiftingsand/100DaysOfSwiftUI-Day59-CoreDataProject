//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Chris Wu on 6/1/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?

    var wrappedFirstName : String {
        firstName ?? "Unknown"
    }
    
    var wrappedLastName : String {
        lastName ?? "Unknown"
    }
}
