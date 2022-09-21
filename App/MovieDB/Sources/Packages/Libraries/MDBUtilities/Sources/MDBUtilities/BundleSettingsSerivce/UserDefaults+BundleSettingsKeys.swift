//
//  UserDefaults+BundleSettingsKeys.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation
import MDBConstants

extension UserDefaults: BundleSettingsKeysProtocol {
  @objc
  dynamic
  var environment: String? {
    string(forKey: MDBConstants.UserDefaultsKeys.BundleSettings.environment.rawValue)
  }
}
