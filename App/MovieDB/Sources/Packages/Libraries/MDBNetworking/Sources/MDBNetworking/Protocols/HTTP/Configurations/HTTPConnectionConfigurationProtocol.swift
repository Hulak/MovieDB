//
//  HTTPConnectionConfigurationProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol HTTPConnectionConfigurationProtocol: ConnectionConfigurationProtocol {
  var sessionConfiguration: URLSessionConfigurationProtocol { get }
}
