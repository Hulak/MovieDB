//
//  DataReturnableProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol DataReturnableProtocol {
  associatedtype DataType: Decodable

  var data: DataType { get }
}
