//
//  MainFlowExitRoutingHandlerProtocol.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022
//
//

import Foundation
import MDBCommonUI

public protocol MainFlowRoutingExitHandler: FlowExitPointProtocol {
  func performRoute(_ coordinator: CoordinatorProtocol, outputModel: ModuleOutputModelProtocol)
}
