//
//  PublicKeyValidatorProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol PublicKeyValidatorProtocol {
  /// Validates an object used to evaluate trust's certificates by comparing their public key hashes
  /// to the known, trused key hashes stored in the app.
  ///
  /// - Parameter serverTrust: The object used to evaluate trust.
  /// - Parameter domain: The domain from where we expect our trust object to come from.
  func validate(serverTrust: SecTrust, domain: String?) -> Bool
}
