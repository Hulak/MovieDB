//
//  ShemeService.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public enum AppScheme: String, CaseIterable {
  case release
  case debug
  case uiTests
}

/// @mockable
public protocol SchemeServiceProtocol {
  var currentScheme: AppScheme { get set }
}

public struct SchemeService: SchemeServiceProtocol {
  public init() {}

  public var currentScheme: AppScheme = .release
}
