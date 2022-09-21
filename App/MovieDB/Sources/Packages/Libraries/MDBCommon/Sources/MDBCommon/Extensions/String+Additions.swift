//
//  String+Additions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation
import UIKit

/// Custom String methods
public extension String {
  /// Removes all whitespaces and newlines and returns new value
  func removeWhitespacesAndNewlines() -> String {
    let characterSet = CharacterSet.whitespacesAndNewlines
    return components(separatedBy: characterSet).joined()
  }
}
