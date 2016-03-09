//
//  NewsDomainModel.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import Foundation

struct NewsDomainModel: Comparable {
  var title: String!
  var description: String!
  var source: String!
  var pubDate: NSDate!
  var image: NSURL?
}

func <(lhs: NewsDomainModel, rhs: NewsDomainModel) -> Bool {
  let result = lhs.pubDate.compare(rhs.pubDate)
  
  switch result {
  case .OrderedAscending: return true
  case .OrderedDescending: fallthrough
  case .OrderedSame: return false
  }
}

func ==(lhs: NewsDomainModel, rhs: NewsDomainModel) -> Bool {
  let result = lhs.pubDate.compare(rhs.pubDate)
  
  switch result {
  case .OrderedSame: return true
  case .OrderedAscending: fallthrough
  case .OrderedDescending: return false
  }
}