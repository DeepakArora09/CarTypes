//
//  AppDelegate.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
  var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = CarTypesModule().initialViewController
    window?.makeKeyAndVisible()
    return true
  }
}
