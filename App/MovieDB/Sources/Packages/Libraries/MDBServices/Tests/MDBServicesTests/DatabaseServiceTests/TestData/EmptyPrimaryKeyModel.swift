//
//  EmptyPrimaryKeyModel.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

@testable import AAServicesMocks

final class EmptyPrimaryKeyModel: RunTimeModelProtocol {
  static func storableType() -> StorableProtocol.Type {
    EmptyPrimaryKeyModelObject.self
  }

  func convertToStorable() -> StorableProtocol {
    EmptyPrimaryKeyModelObject(primaryKey: nil)
  }
}
