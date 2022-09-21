//
//  GenericError.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol CustomError: LocalizedError {}

/// GenericError protocol
public protocol GenericError: CustomError {
  /// Generic ErrorType to return. Should conforms to `Error` protocol.
  associatedtype ErrorType where ErrorType: Error

  /// Method for "mapping" error with type of `Error` to new type `ErrorType`.
  ///
  /// - Parameter error: input `Error`.
  ///
  /// - Returns: output `ErrorType`.
  static func genericError(with error: Error) -> ErrorType
}
