//
//  NewsListModuleCell.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import UIKit
import Alamofire

class NewsListModuleCell: UITableViewCell {
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.imageView?.image = UIImage(named: "DefaultNewsIcon")
    self.textLabel?.text = ""
    self.detailTextLabel?.text = ""
  }
  
  func fill(news: NewsDomainModel, expanded: Bool) {
    self.textLabel?.text = "[\(news.source)] \(news.title)"
    
    if expanded {
      self.detailTextLabel?.text = news.description
    } else {
      self.detailTextLabel?.text = ""
    }
    
    if let imgURI = news.image {
      Alamofire.request(.GET, imgURI).responseData({
        response in
        
        if let data = response.result.value {
          let img = UIImage(data: data)
          
          self.imageView?.image = img
        }
      })
    }
  }
  
  //MARK: Helpers
  
  class func height(forTitle title: String, inWidth width: CGFloat) -> CGFloat {
    let font = UIFont.systemFontOfSize(UIFont.labelFontSize())
    
    return 8 + 8 + self.height(forText: title, font: font, width: width)
  }
  
  class func height(forTitle title: String, andDetail detail: String, inWidth width: CGFloat) -> CGFloat {
    let font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
    
    return self.height(forTitle: title, inWidth: width) + 8 + self.height(forText: detail, font: font, width: width)
  }
  
  private class func height(forText text: String, font: UIFont, width: CGFloat) -> CGFloat {
    let helperString = text as NSString
    let size = CGSizeMake(width, CGFloat.max)
    
    let rect = helperString.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
    
    return rect.height
  }
}