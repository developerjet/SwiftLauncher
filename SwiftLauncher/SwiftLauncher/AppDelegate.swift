//
//  AppDelegate.swift
//  SwiftLauncher
//
//  Created by Jett on 2022/5/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor(red: 29 / 255.0, green: 161 / 255.0, blue: 242 / 255.0, alpha: 1)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewControllerID")
        
        if let view = window?.rootViewController?.view {
            addLauncher(sourceView: view)
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func addLauncher(sourceView: UIView) {
        
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = sourceView.center
        logoLayer.contents = UIImage(named: "logo")?.cgImage
        sourceView.layer.mask = logoLayer
        
        let shelterView = UIView(frame: sourceView.frame)
        shelterView.backgroundColor = .white
        sourceView.addSubview(shelterView)
        
        SwiftLauncher().config { (launcher) in
            launcher.animationStyle(style: .twitter)
            launcher.launcherLayer(layer: logoLayer)
            launcher.sourceView(view: sourceView)
            launcher.shelterView(view: shelterView)
            launcher.duration(time: 1.25)
            launcher.delay(time: 1.35)
        }.beginAnimation()
    }
}

