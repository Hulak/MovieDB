//
//  URLSessionConfiguration.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public struct HTTPURLSessionConfiguration: URLSessionConfigurationProtocol {
  public let configurationType: URLSessionConfigurationType
  public let cachePolicy: NSURLRequest.CachePolicy
  public var sessionIdentifier: String?

  public init(
    configurationType: URLSessionConfigurationType,
    cachePolicy: NSURLRequest.CachePolicy,
    sessionIdentifier: String? = nil
  ) {
    self.configurationType = configurationType
    self.cachePolicy = cachePolicy
    self.sessionIdentifier = sessionIdentifier
  }
}
