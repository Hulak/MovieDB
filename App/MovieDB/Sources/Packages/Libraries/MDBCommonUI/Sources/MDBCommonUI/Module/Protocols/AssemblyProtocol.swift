//
//  AssemblyProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation

public protocol AssemblyProtocol {
  associatedtype Output
  associatedtype RoutingHandler
  associatedtype Module

  func build(_ moduleOutput: Output?,
             _ routingHandler: RoutingHandler) -> Module
}

public protocol CoordinatorAssemblyProtocol {
  associatedtype RoutingHandler
  associatedtype Coordinator

  func build(routingHandler: RoutingHandler) -> Coordinator
}

public protocol FlowCoordinatorAssemblyProtocol {
  associatedtype CoordinatorRouter
  associatedtype RoutingHandler
  associatedtype Coordinator

  func build(router: CoordinatorRouter,
             routingHandler: RoutingHandler) -> Coordinator
}
