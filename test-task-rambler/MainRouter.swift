//
//  MainRouter.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

class MainRouter {
  let newsList = NewsListModuleAssembly.createModule()
  
  func initRouter(window: UIWindow) {
    self.newsList.present(fromWindow: window)
  }
}