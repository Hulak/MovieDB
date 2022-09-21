//
//  UISegmentedControl+Extensions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import UIKit

public extension UISegmentedControl {
  func replaceSegments(segments: [String]) {
    removeAllSegments()
    for segment in segments {
      insertSegment(withTitle: segment, at: numberOfSegments, animated: false)
    }
  }
}
