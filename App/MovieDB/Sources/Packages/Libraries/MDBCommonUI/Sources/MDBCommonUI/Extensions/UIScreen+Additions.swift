//
//  UIScreen+Additions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import UIKit

public extension UIScreen {
  static var safeAreaInsets: UIEdgeInsets {
    guard
      let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    else {
      return .zero
    }

    return keyWindow.safeAreaInsets
  }
}
