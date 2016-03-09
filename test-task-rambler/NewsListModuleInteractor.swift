//
//  NewsListModuleInteractor.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import Foundation

class NewsListModuleInteractor: NewsListModuleInteractorInput {
  weak var output: NewsListModuleInteractorOutput!
  var XMLFetcher: XMLFetcherInterface!
  var XMLParser: XMLParserInterface!
  
  func loadNews() {
    self.XMLFetcher.fetch(Settings.rssFeeds) {
      data in
      
      if data.count > 0 {
        let items = self.XMLParser.parse(data)
        
        let sorted = items.sort(>)
        
        for item in sorted {
          print(item.source, item.title)
        }
      }
    }
  }
}