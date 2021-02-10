//
//  AppSettings.swift
//  Example MeetUp 10.02.2021
//
//  Copyright (c) 2021 SevenPeaks Software
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
