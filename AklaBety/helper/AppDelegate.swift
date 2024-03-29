//
//  AppDelegate.swift
//  AklaBety
//
//  Created by Mac on 7/29/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,GIDSignInDelegate{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        
        let mainVC = StartVC(nibName: "StartVC", bundle: nil)
        window?.rootViewController = mainVC
        
        
    // For all navigation controller Layout
        /*
    let navigationBarAppearace = UINavigationBar.appearance()
        
    navigationBarAppearace.barTintColor = UIColor(red: 23/255, green: 57/255, blue: 3/255, alpha: 1)
        */
        
        
        GIDSignIn.sharedInstance().clientID = "266274282237-l9kppa0g27m7fvotc95ifj7as7g1d0s0.apps.googleusercontent.com"

        GIDSignIn.sharedInstance().delegate = self
        
        
        return true
    }

    
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        return GIDSignIn.sharedInstance().handle(url as URL?,
                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        
        
        
        
    }
    
    
    
    
    
    private func application(application: UIApplication,
                             openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        var _: [String: AnyObject] = [UIApplication.OpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject,
                                      UIApplication.OpenURLOptionsKey.annotation.rawValue: annotation ?? "any" as AnyObject]
        return GIDSignIn.sharedInstance().handle(url as URL,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }
    
    
    
    ///
    
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

