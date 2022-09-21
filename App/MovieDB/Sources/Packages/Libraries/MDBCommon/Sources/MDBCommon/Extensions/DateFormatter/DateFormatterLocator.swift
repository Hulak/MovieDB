//
//  DateFormatterLocator.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

/// @mockable
public protocol DateFormatterLocatorProtocol {
  func dateFormatter() -> DateFormatter
}

public extension DateFormatterLocatorProtocol {
  func dateFormatter() -> DateFormatter {
    DateFormatter()
  }
}
