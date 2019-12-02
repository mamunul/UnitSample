//
//  Activities+CoreDataProperties.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import Foundation
import CoreData


extension Activities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activities> {
        return NSFetchRequest<Activities>(entityName: "Activities")
    }

    @NSManaged public var name: String?
    @NSManaged public var requiredPlayers: Int16
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension Activities {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
