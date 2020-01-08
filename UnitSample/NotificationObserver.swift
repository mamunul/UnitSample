//
//  NotificationObserver.swift
//  UnitSample
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation

class NotificationObserver {
    var observer: AnyObject?

    var didHandleNotification = false

    init(notification: NotificationCenter = .default) {
        observer = notification.addObserver(forName: NotificationObservable.notificationName, object: nil, queue: .main) { [weak self] _ in

            guard let self = self else { return }
            self.handleNotification()
        }
    }

    func handleNotification() {
        didHandleNotification = true
    }
}
