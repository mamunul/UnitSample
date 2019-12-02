//
//  User+CoreDataProperties.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import Foundation
import CoreData


extension User {
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)!
        self.init(entity: entityDescription, insertInto: context)
    }

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    private class func getAllData(){
        
    }

    @NSManaged public var age: Int16
    @NSManaged public var country: String?
    @NSManaged public var name: String?
    @NSManaged public var activities: NSSet?

}

// MARK: Generated accessors for activities
extension User {

    @objc(addActivitiesObject:)
    @NSManaged public func addToActivities(_ value: Activities)

    @objc(removeActivitiesObject:)
    @NSManaged public func removeFromActivities(_ value: Activities)

    @objc(addActivities:)
    @NSManaged public func addToActivities(_ values: NSSet)

    @objc(removeActivities:)
    @NSManaged public func removeFromActivities(_ values: NSSet)

}
