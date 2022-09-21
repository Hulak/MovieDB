//
//  HTTPServiceProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

/// @mockable
public protocol HTTPServiceProtocol {
  var ignoreSecurityCheck: Bool { get set }
  var reachabilityChangePublisher: AnyPublisher<Bool, Never> { get }

  func isReachable() -> Bool

  func httpTaskWith<Response, Decoder, Request>(
    request: Request,
    configurationType: URLSessionConfigurationType
  ) -> AnyPublisher<Data, Error>
    where Request: BaseHTTPRequest<Response, Decoder>,
    Response: BaseResponseProtocol,
    Decoder: CustomDecoder,
    Decoder.Decoder.Input == Data

  func hashTaskWith(url: URLRequest) -> AnyPublisher<Data, NetworkingError>
}

public extension HTTPServiceProtocol {
  func httpTaskWith<Response, Decoder, Request>(
    request: Request
  ) -> AnyPublisher<Data, Error>
    where Request: BaseHTTPRequest<Response, Decoder>,
    Response: BaseResponseProtocol,
    Decoder: CustomDecoder,
    Decoder.Decoder.Input == Data
  {
    httpTaskWith(
      request: request,
      configurationType: .default
    )
  }
}
