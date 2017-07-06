//
//  AppDelegate.swift
//  Closet Space
//
//  Created by Saketh D on 6/29/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

let BLACKCOLOR = UIColor.black
let WHITECOLOR = UIColor.white
let DANDELIONCOLOR = UIColor(red: 255/256, green: 212/256, blue: 100/256, alpha: 1)
let FONT = UIFont(name: "Bodoni 72 Oldstyle", size: 27)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navigationBarApperance = UINavigationBar.appearance()
        
        navigationBarApperance.barTintColor = BLACKCOLOR
        navigationBarApperance.tintColor = DANDELIONCOLOR
        navigationBarApperance.titleTextAttributes = [NSForegroundColorAttributeName:WHITECOLOR, NSFontAttributeName: FONT ?? UIFont.systemFont(ofSize: 27)]
        
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

