//
//  NewsListModulePresenter.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

class NewsListModulePresenter: NewsListModuleInput {
  var view: NewsListModuleViewInput!
  var interactor: NewsListModuleInteractorInput!
  var router: NewsListModuleRouterInput!
  
  
  func present(fromWindow window: UIWindow) {
    self.router.present(fromWindow: window)
  }
}

extension NewsListModulePresenter: NewsListModuleViewOutput {
  func viewDidLoad() {
    self.interactor.loadNews()
  }
  
  func refreshRequested() {
    self.interactor.loadNews()
  }
}

extension NewsListModulePresenter: NewsListModuleInteractorOutput {
  func newsDidLoad(news: [NewsDomainModel]) {
    self.view.update(withNews: news)
  }
}