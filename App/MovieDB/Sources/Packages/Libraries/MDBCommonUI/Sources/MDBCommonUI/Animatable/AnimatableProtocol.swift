//
//  AnimatableProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

/// AnimatableProtocol is wrapper arround `Animatable` structure
public protocol AnimatableProtocol: AnyObject {}

public extension AnimatableProtocol {
  /// Returns instance of `Animatable` struct
  var animatable: Animatable<Self> {
    Animatable(self)
  }
}
