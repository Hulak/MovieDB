//
//  UrlRoute.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public enum UrlRoute {
  case mobile
  case common
  case custom(String)

  public func stringRepresentation() -> String {
    switch self {
    case .mobile:
      return ""
    case .common:
      return "common"
    case let .custom(string):
      return string
    }
  }
}
