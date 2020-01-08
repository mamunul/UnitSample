//
//  CoreDataManager.swift
//  UnitSample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//

import CoreData
import Foundation
import UIKit

enum CoreDataError: Error {
    case read
    case save
}

class CoreDataManager {
    var persistentContainer: NSPersistentContainer?
    let backgrundContext: NSManagedObjectContext?
    let mainContext: NSManagedObjectContext?

    init() {
        backgrundContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.newBackgroundContext()
        mainContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }

    func insertUser(userData: UserModel) {
        guard let context = backgrundContext else { return }

        let user = User(context: context)
        user.insert(from: userData)
    }

    func readUser() {
        guard let context = backgrundContext else { return }
        let res = try? context.fetch(User.fetchRequest()) as [User]

        guard let userArray = res else { return }
        for user in userArray {
            print(user)
            guard let activities = user.activities else { continue }
            for activity in activities {
                print(activity)
            }
        }
    }
}
