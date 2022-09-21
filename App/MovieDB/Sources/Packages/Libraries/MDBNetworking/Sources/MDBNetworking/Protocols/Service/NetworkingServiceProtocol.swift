//
//  NetworkingServiceProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

/// @mockable
public protocol NetworkingServiceProtocol {
  var httpService: HTTPServiceProtocol? { get }
  var reachabilityChangePublisher: AnyPublisher<Bool, Never> { get }

  func isReachable() -> Bool

  func httpTaskWith<Response, Decoder, Request>(
    request: Request,
    configurationType: URLSessionConfigurationType
  ) -> AnyPublisher<Response, Error>
    where Request: BaseHTTPRequest<Response, Decoder>,
    Response: BaseResponseProtocol,
    Decoder: CustomDecoder,
    Decoder.Decoder.Input == Data
}
