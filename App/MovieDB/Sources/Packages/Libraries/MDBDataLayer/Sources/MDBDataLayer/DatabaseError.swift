//
//  DatabaseError.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

/// Enum represents cases of error that may occurs due working with "Database".
public enum DatabaseError: Error, GenericError {
  case databaseDoesntExists
  case objectDoesntExists
  case objectsKeyDoesntExists
  case encryptionKeyGeneratingError
  case generic(Error)

  public static func genericError(with error: Error) -> DatabaseError {
    DatabaseError.generic(error)
  }
}
