//
//  XMLParserInterface.swift
//  test-task-rambler
//
//  Created by Alexey on 09/03/16.
//
//

import Foundation

protocol XMLParserInterface: class {
  func parse(data: [NSData]) -> [NewsDomainModel]
}