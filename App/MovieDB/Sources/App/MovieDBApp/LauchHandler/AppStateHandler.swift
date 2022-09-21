//
//  AppStateHandler.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022
//

import Foundation
import MDBConstants
import MDBServices
import MDBUtilities

/// Protocol that represents object to handle app state changing.
protocol AppStateHandlerProtocol {
  /// Method to run initial setup on application launch.
  func initialSetup(completion: ((Bool) -> Void)?)
}

/// Default implementation for `AppStateHandlerProtocol`.
final class AppStateHandler: AppStateHandlerProtocol {
  private let networkingService: NetworkingServiceProtocol
  private let userDefaults: UserDefaultsProtocol
  private var subscriptions = Set<AnyCancellable>()

  init(
    networkingProvider: NetworkingProviderProtocol,
    userDefaults: UserDefaultsProtocol
  ) {
    networkingService = networkingProvider.networkingService
    self.userDefaults = userDefaults
  }

  func initialSetup(completion: ((Bool) -> Void)?) {
    let isNotificationsEnabled = userDefaults.getValue(
      forKey: MDBConstants.UserDefaultsKeys.UserPreferences.notificationsEnabled.rawValue
    ) as? Bool ?? true

    guard networkingService.isReachable() else {
      networkingService
        .reachabilityChangePublisher
        .sink { [weak self] isReachable in
          if isReachable {
            self?.subscriptions.removeAll()
            completion?(isNotificationsEnabled)
          }
        }.store(in: &subscriptions)
      return
    }
    completion?(isNotificationsEnabled)
  }
}
