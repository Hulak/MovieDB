//
//  JSONParameterEncoder.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

struct JSONParameterEncoder: JSONParameterEncoderProtocol {
  func encode<RequestParameters: Encodable>(
    urlRequest: inout URLRequest,
    with requestParameters: RequestParameters
  ) throws {
    do {
      let encoder = JSONEncoder()
      encoder.keyEncodingStrategy = .convertToSnakeCase
      let jsonData = try encoder.encode(requestParameters)
      urlRequest.httpBody = jsonData
    } catch {
      throw NetworkingError.encodingFailed
    }
  }
}
