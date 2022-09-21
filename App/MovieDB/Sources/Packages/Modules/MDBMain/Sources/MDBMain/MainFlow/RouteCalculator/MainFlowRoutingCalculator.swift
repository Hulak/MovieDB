//
//  MainFlowRoutingCalculator.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022
//
//

import Foundation
import MDBCommonUI

public protocol MainFlowRoutingCalculatorProtocol {
  func directRoute(_ route: MainFlowOption?) -> MainFlowOption
  func createOption(from output: ModuleOutputModelProtocol?) -> MainFlowOption
}

class MainFlowRoutingCalculator: MainFlowRoutingCalculatorProtocol {
  let routingConfigsProvider: MainFlowRoutingConfigsProviderProtocol

  init(routingConfigsProvider: MainFlowRoutingConfigsProviderProtocol) {
    self.routingConfigsProvider = routingConfigsProvider
  }

  func directRoute(_ route: MainFlowOption?) -> MainFlowOption {
    guard let route = route else {
      return .moviesList
    }

    return route
  }

  func createOption(from output: ModuleOutputModelProtocol?) -> MainFlowOption {
    if let output = output as? MoviesListOutputModel {
      return MainFlowOption.movieDetails(.init(model: output.movie))
    }
    return MainFlowOption.moviesList
  }
}
