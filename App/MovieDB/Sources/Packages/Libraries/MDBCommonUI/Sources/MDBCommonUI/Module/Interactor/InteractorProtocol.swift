//
//  InteractorProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol InteractorProtocol {
  associatedtype PresenterInput

  var presenter: PresenterInput? { get set }
}
