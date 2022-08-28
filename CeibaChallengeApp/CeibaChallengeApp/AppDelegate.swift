//
//  AppDelegate.swift
//  CeibaChallengeApp
//
//  Created by Matias Castillo on 24/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let initialController = BaseNavigationController(rootViewController: HomeViewController())
        
        window.rootViewController = initialController
        window.makeKeyAndVisible()
        
        return true
    }

}
