//
//  NewsListModuleViewController.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import UIKit

class NewsListModuleViewController: UIViewController, NewsListModuleViewInput {
  let newsCellIdentifier = "newsCellIdentifier"
  
  weak var output: NewsListModuleViewOutput!
  
  var expandedCells: [Bool]!
  var news: [NewsDomainModel]? {
    willSet(newValue) {
      self.expandedCells = Array.init(count: newValue!.count, repeatedValue: false)
    }
  }
  
  @IBOutlet weak var tableView: UITableView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    
    output.viewDidLoad()
  }
  
  //MARK: View input
  
  func update(withNews news: [NewsDomainModel]) {
    self.news = news
    
    self.tableView.reloadData()
  }
  
  //MARK: Helpers
  
  func news(atIndex indexPath: NSIndexPath) -> NewsDomainModel? {
    if let news = self.news where indexPath.row < news.count + 1 {
      return news[indexPath.row]
    }
    
    return nil
  }
  
  func cell(expandedAt indexPath: NSIndexPath) -> Bool {
    if let expanded = self.expandedCells {
      return expanded[indexPath.row]
    }
    
    return false
  }
}

extension NewsListModuleViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let news = self.news {
      return news.count
    }
    
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(self.newsCellIdentifier, forIndexPath: indexPath) as! NewsListModuleCell
    
    if let news = self.news(atIndex: indexPath) {
      cell.fill(news, expanded: self.expandedCells[indexPath.row])
    }
    
    return cell
  }
}

extension NewsListModuleViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    var height: CGFloat = 0
    
    if let news = self.news(atIndex: indexPath) {
      // total width - left offset - offset between avatar and text - avatar width - right offset
      let width = tableView.frame.width - 8 - 8 - 100 - 8
      
      if self.cell(expandedAt: indexPath) {
        height = NewsListModuleCell.height(forTitle: "[\(news.source)] \(news.title)", andDetail: news.description, inWidth: width)
      } else {
        height = NewsListModuleCell.height(forTitle: "[\(news.source)] \(news.title)", inWidth: width)
        
        if height < 116 {
          height = 116
        }
      }
    }
    
    return height
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    self.expandedCells[indexPath.row] = !self.expandedCells[indexPath.row]
    
    tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Right)
    tableView.deselectRowAtIndexPath(indexPath, animated: false)
  }
}