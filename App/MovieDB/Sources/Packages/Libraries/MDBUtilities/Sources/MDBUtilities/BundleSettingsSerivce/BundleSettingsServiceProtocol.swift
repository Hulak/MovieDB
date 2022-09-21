//
//  BundleSettingsServiceProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

/// BundleSettings Service
/// @mockable
public protocol BundleSettingsServiceProtocol {
  /// `environment`  sequance of `Environment` objects
  var environment: AnyPublisher<MovieDBEnvironment, Never> { get }
}
