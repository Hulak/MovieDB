//
//  Publisher+Additions.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Combine

public extension Publisher {
  func receiveOutput(
    _ handler: @escaping () -> Void
  ) -> AnyPublisher<Self.Output, Self.Failure> {
    handleEvents(receiveOutput: { _ in handler() })
      .eraseToAnyPublisher()
  }
}
