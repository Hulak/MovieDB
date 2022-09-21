//
//  TestPerson.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

@testable import AAServicesMocks

final class TestPerson: RunTimeModelProtocol {
  var firstName: String
  var lastName: String
  var primaryKey: String

  init(firstName: String, lastName: String, primaryKey: String = UUID().uuidString) {
    self.firstName = firstName
    self.lastName = lastName
    self.primaryKey = primaryKey
  }

  static func storableType() -> StorableProtocol.Type {
    TestPersonStorable.self
  }

  func convertToStorable() -> StorableProtocol {
    TestPersonStorable(firstName: firstName, lastName: lastName, primaryKey: primaryKey)
  }
}
