//
//  Lens.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public struct Lens<View, Projected> {
  public let get: (View) -> Projected
  public let set: (Projected, View) -> View

  public init(
    get: @escaping (View) -> Projected,
    set: @escaping (Projected, View) -> View
  ) {
    self.get = get
    self.set = set
  }
}
