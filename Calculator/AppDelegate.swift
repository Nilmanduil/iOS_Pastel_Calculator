//
//  AppDelegate.swift
//  Calculator
//
//  Created by Thibault Goudouneix on 23/10/2017.
//  Copyright © 2017 Thibault Goudouneix. All rights reserved.
// swiftlint:disable line_length trailing_newline vertical_whitespace

import UIKit
import Sentry

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Create a Sentry client and start crash handler
        do {
            Client.shared = try Client(dsn: "https://5064e6a5da1c4585916abb566b22ac05:6b819e93ffb34c3f81b1ff24c8373b28@sentry.io/247891")
            try Client.shared?.startCrashHandler()
        } catch let error {
            print("\(error)")
            // Wrong DSN or KSCrash not installed
        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

