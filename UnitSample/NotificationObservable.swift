//
//  NotificationObservable.swift
//  UnitSample
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation

class NotificationObservable {
    static let notificationName = Notification.Name("Notification")
    let notificationCenter: NotificationCenter

    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
    }

    func notifyObserver() {
        notificationCenter.post(name: NotificationObservable.notificationName, object: self)
    }
}
