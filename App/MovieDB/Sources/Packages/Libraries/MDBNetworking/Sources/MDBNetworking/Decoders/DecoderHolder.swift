//
//  DecoderHolder.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol JSONDecoderHolder {
  var decoder: JSONDecoder { get }
}

public extension JSONDecoderHolder {
  var decoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
  }
}

public protocol ImageDecoderHolder {
  var decoder: ImageDecoder<ImageResponseObject> { get }
}

public extension ImageDecoderHolder {
  var decoder: ImageDecoder<ImageResponseObject> {
    let decoder = ImageDecoder<ImageResponseObject>()
    return decoder
  }
}
