//
//  Collection+Extensions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public extension Collection {
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
