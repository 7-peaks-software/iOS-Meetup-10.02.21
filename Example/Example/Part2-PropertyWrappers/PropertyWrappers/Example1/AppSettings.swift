//
//  AppSettings.swift
//  Example
//
//  Created by TonSevenPeaks on 8/2/2564 BE.
//  Copyright © 2564 BE SevenPeaks Software. All rights reserved.
//

import Foundation
struct AppSettings {
//    static let shared = AppSettings()
//    var appLanguage: String {
//        get { UserDefaults.standard.value(forKey: "app_language") as? String ?? "" }
//        set { UserDefaults.standard.set(newValue, forKey: "app_language") }
//    }
//
//    var appVersion: String {
//        get { UserDefaults.standard.value(forKey: "app_version") as? String ?? "" }
//        set { UserDefaults.standard.set(newValue, forKey: "app_version") }
//    }
//
//    var isLoggedIn: Bool {
//        get { UserDefaults.standard.value(forKey: "is_logged_in") as? Bool ?? false }
//        set { UserDefaults.standard.set(newValue, forKey: "is_logged_in") }
//    }
//
//    var isEnabledNotification: Bool {
//        get { UserDefaults.standard.value(forKey: "is_enabled_notification") as? Bool ?? false }
//        set { UserDefaults.standard.set(newValue, forKey: "is_enabled_notification") }
//    }

    
    // Property wrapper
    @PropertyWrapperUserDefaults(key: "app_language", defaultValue: "") static var appLanguage: String
    @PropertyWrapperUserDefaults(key: "app_version", defaultValue: "") static var appVersion: String
    @PropertyWrapperUserDefaults(key: "is_logged_in", defaultValue: false) static var isLoggedIn: Bool
    @PropertyWrapperUserDefaults(key: "is_enabled_notification", defaultValue: false) static var isEnabledNotification: Bool

}
