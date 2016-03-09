//
//  XMLFetcher.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import Foundation
import Alamofire

class XMLFetcher: XMLFetcherInterface {
  let fetchGroup = dispatch_group_create()
  
  func fetch(urls: [String], completion: [NSData] -> Void) {
    var result = [NSData]()
    
    for url in urls {
      dispatch_group_enter(self.fetchGroup)
      
      Alamofire.request(.GET, url).responseData({
        response in
        
        if let error = response.result.error {
          print("download error %@", error.localizedDescription)
        }
        
        if let data = response.result.value {
          result.append(data)
        }
        
        dispatch_group_leave(self.fetchGroup)
      })
    }
    
    dispatch_group_notify(self.fetchGroup, dispatch_get_main_queue(), {
      completion(result)
    })
  }
}