//
//  Bundle+Extensions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public extension Bundle {
  var appName: String {
    guard let name = object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String else {
      return ""
    }

    return name
  }
}
