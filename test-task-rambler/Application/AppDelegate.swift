//
//  AppDelegate.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let router = MainRouter()


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window?.backgroundColor = UIColor.whiteColor()
    
    self.router.initRouter(self.window!)
    
    return true
  }

}

