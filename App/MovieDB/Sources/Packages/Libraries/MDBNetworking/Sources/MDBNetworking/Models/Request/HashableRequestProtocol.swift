//
//  HashableRequestProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol HashableRequestProtocol {
  var hashEndPoint: String { get }
  var headers: [String: String] { get }
}
