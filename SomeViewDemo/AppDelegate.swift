//
// AppDelegate.swift
// SomeViewDemo
//
// Created by KellenChou on 2024/11/2
// Copyright © 2024 ZKL. All rights reserved.
//
    

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
                
        return true
    }
    
    
    
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//        
//        return UIInterfaceOrientationMask.landscapeRight
//    }
    
}

