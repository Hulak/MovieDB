//
//  ParameterEncoder.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol JSONParameterEncoderProtocol {
  func encode<RequestParameters: Encodable>(
    urlRequest: inout URLRequest,
    with requestParameters: RequestParameters
  ) throws
}

public protocol URLParameterEncoderProtocol {
  func encode(urlRequest: inout URLRequest, with parameters: URLParameters) throws
}
