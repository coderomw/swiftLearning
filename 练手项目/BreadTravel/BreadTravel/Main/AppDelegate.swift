//
//  AppDelegate.swift
//  BreadTravel
//
//  Created by lei xu on 2020/8/26.
//  Copyright © 2020 lei xu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navi = UINavigationController(rootViewController: HomeViewController.init())
        self.window=UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController=navi;
        self.window?.backgroundColor=UIColor.white
        self.window?.makeKeyAndVisible()
        return true
    }



}

