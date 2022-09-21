//
//  CustomErrorHandler+Extensions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import MDBNetworking

public extension CustomErrorHolder where Decoder.Input == Data {
  func checkIfDataHasError(_ data: Data) -> Error? {
    do {
      let errorModel = try decoder.decode(type(of: self).validationErrorType, from: data)
      return ServerRequestError.serverResponse(errorModel)
    } catch {
      return nil
    }
  }
}
