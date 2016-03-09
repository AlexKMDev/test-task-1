//
//  NewsListAssembly.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

class NewsListModuleAssembly {
  class func createModule() -> NewsListModuleInput {
    let vc = self.initViewController()
    let interactor = NewsListModuleInteractor()
    let presenter = NewsListModulePresenter()
    let router = NewsListModuleRouter()
    
    router.presenter = presenter
    router.controller = vc
    
    vc.output = presenter
    
    interactor.output = presenter
    interactor.XMLFetcher = XMLFetcher()
    interactor.XMLParser = XMLParser()
    
    presenter.view = vc
    presenter.interactor = interactor
    presenter.router = router
    
    return presenter
  }
  
  private class func initViewController() -> NewsListModuleViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewControllerWithIdentifier("NewsListModuleViewController") as! NewsListModuleViewController
    
    return vc
  }
}