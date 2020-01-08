//
//  Activities+CoreDataClass.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import CoreData
import Foundation

@objc(Activities)
public class Activities: NSManagedObject {
    func insert(from activity: ActivityModel) {
        requiredPlayers = Int16(activity.playersNumber)
        name = activity.name
    }
}
