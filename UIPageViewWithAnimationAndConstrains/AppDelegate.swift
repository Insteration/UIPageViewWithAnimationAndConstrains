//
//  AppDelegate.swift
//  UIPageViewWithAnimationAndConstrains
//
//  Created by Artem Karmaz on 4/18/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: CarViewController())
        return true
    }

}

