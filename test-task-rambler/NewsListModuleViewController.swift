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
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    
    output.viewDidLoad()
  }
}

extension NewsListModuleViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(self.newsCellIdentifier, forIndexPath: indexPath)
    
    // configure cell
    
    return cell
  }
}

extension NewsListModuleViewController: UITableViewDelegate {
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
    return 0
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}