//
//  AppDelegate.swift
//  LargeTitle
//
//  Created by Egor Mezhin on 22.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = ViewController()
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        navigationViewController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

