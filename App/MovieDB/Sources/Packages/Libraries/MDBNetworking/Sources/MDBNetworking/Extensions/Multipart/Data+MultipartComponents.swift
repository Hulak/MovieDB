//
//  Data+MultipartComponents.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

extension Data {
  mutating func append(_ string: String) {
    if let data = string.data(using: .utf8) {
      append(data)
    }
  }
}
