//
//  XMLFetcherInterface.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import Foundation

protocol XMLFetcherInterface {
  func fetch(urls: [String], completion: [NSData] -> Void)
}