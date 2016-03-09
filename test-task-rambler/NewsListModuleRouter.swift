//
//  NewsListModuleRouter.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

class NewsListModuleRouter: NewsListModuleRouterInput {
  var presenter: NewsListModulePresenter!
  weak var controller: UIViewController!
  
  func present(fromWindow window: UIWindow) {
    window.rootViewController = self.controller
    window.makeKeyAndVisible()
  }
}