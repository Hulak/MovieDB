//
//  ThemeTypeProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

/// @mockable
public protocol ModeTypeProtocol {
  func factoryType() -> ColorThemeFactoryProtocol.Type
  func isEqual(_ other: ModeTypeProtocol) -> Bool
}
