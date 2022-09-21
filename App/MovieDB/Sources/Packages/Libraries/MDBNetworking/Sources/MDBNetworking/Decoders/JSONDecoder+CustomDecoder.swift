//
//  JSONDecoder+CustomDecoder.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

extension JSONDecoder: CustomDecoder {
  public static func create() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .secondsSince1970

    return decoder
  }
}
