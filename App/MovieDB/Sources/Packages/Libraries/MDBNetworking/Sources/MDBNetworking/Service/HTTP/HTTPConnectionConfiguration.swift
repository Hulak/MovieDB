//
//  HTTPConnectionConfiguration.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public struct HTTPConnectionConfiguration: HTTPConnectionConfigurationProtocol {
  public let sessionConfiguration: URLSessionConfigurationProtocol
  public let workQueue: DispatchQueue
  public let resultQueue: DispatchQueue

  public init(
    sessionConfiguration: URLSessionConfigurationProtocol,
    workQueue: DispatchQueue = .global(),
    resultQueue: DispatchQueue = .main
  ) {
    self.sessionConfiguration = sessionConfiguration
    self.workQueue = workQueue
    self.resultQueue = resultQueue
  }
}
