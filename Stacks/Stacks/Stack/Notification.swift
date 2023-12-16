//
//  Notification.swift
//  Stacks
//
//  Created by Guac on 12/16/23.
//

import Foundation
import UIKit

struct Notifications {
    static var showSplashScreenNotificationName: Notification.Name {
        Notification.Name("AppWillShowSplashScreenNotification")
    }

    static func postShowSplashScreenNotification() {
        NotificationCenter.default.post(name: showSplashScreenNotificationName, object: nil)
    }

    static var hideSplashScreenNotificationName: Notification.Name {
        Notification.Name("AppWillShowHideScreenNotification")
    }

    static func postHideSplashScreenNotification() {
        NotificationCenter.default.post(name: hideSplashScreenNotificationName, object: nil)
    }
}
