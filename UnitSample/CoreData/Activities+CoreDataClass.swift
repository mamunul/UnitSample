//
//  Activities+CoreDataClass.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Activities)
public class Activities: NSManagedObject {

    
    func insert(from activity:ActivityModel){
        
        self.requiredPlayers = Int16(activity.playersNumber)
        self.name = activity.name
    }
}
