//
//  CustomDecoder.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol CustomDecoder: TopLevelDecoder {
  associatedtype Decoder: CustomDecoder
  static func create() -> Decoder
}
