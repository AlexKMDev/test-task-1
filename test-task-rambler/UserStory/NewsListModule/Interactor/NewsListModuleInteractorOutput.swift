//
//  NewsListModuleInteractorOutput.swift
//  test-task-rambler
//
//  Created by Alexey on 08/03/16.
//
//

import Foundation

protocol NewsListModuleInteractorOutput: class {
  func newsDidLoad(news: [NewsDomainModel])
}