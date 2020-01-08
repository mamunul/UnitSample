//
//  User+CoreDataClass.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import CoreData
import Foundation

@objc(User)
public class User: NSManagedObject {
    func insert(from user: UserModel) {
        name = user.name
        age = Int16(user.age)
        country = user.country

        if let activities = user.activities {
            insert(activityModel: activities)
        }
        if let context = self.managedObjectContext, context.hasChanges {
            try? context.save()
        }
    }

    private func insert(activityModel: [ActivityModel]) {
        if let context = self.managedObjectContext {
            for activity in activityModel {
                let activities = Activities(context: context)

                activities.insert(from: activity)
                addToActivities(activities)
            }
        }
    }

    func read() throws {
        if let context = self.managedObjectContext {
            do {
                let result = try context.fetch(User.fetchRequest())

            } catch {
                throw CoreDataError.read
            }
        }
    }
}
