//
//  XMLParser.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import Foundation
import AEXML

class XMLParser: NSObject, XMLParserInterface {
  let dateFormatter = NSDateFormatter()
  
  func parse(data: [NSData]) -> [NewsDomainModel] {
    var result = [NewsDomainModel]()
    
    for data in data {
      do {
        let doc = try AEXMLDocument(xmlData: data)
        let channel = doc.root["channel"]
        
        if let items = doc.root["channel"]["item"].all {
          for item in items {
            var model = NewsDomainModel()
            
            model.source = channel["title"].stringValue
            model.title = item["title"].stringValue
            model.description = item["description"].stringValue
            model.pubDate = self.formatDate(item["pubDate"].stringValue)
            
            if let url = item["enclosure"].attributes["url"] {
              model.image = NSURL(string: url)
            }
            
            result.append(model)
          }
        }
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
    
    return result
  }
  
  func formatDate(string: String) -> NSDate {
    dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
    
    if let result = dateFormatter.dateFromString(string) {
      return result
    } else {
      return NSDate(timeIntervalSince1970: 0)
    }
  }
}