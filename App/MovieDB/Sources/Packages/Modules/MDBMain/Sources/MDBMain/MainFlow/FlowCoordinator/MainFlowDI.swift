//
//  MainFlowDI.swift
//
//
//  Created by Alena Hulak on 09.09.2022.
//

import MDBCommon
import MDBCommonUI
import MDBComponents
import MDBDataLayer
import MDBServices
import NeedleFoundation

/// Flow's coordinator builder
public protocol MainFlowCoordinatorBuilder: ModuleBuilder {
  var interactor: MainFlowInteractorProtocol { get }

  func routingCalculator(
    routingConfigsProviderProtocol: MainFlowRoutingConfigsProviderProtocol
  ) -> MainFlowRoutingCalculatorProtocol

  func moviesListCoordinator(
    exitPoint: MoviesListCoordinatorExitRoutingProtocol
  ) -> MoviesListCoordinatorProtocol

  func moviesDetailsCoordinator(
    exitPoint: MovieDetailsCoordinatorExitRoutingProtocol
  ) -> MovieDetailsCoordinatorProtocol
}

/// Flow coordinator DI component
public final class MainFlowCoordinatorDIComponent: Component<EmptyDependency>,
  MainFlowCoordinatorBuilder
{
  public var interactor: MainFlowInteractorProtocol {
    MainFlowInteractor()
  }

  public func routingCalculator(
    routingConfigsProviderProtocol: MainFlowRoutingConfigsProviderProtocol
  ) -> MainFlowRoutingCalculatorProtocol {
    MainFlowRoutingCalculator(routingConfigsProvider: routingConfigsProviderProtocol)
  }

  public func moviesListCoordinator(
    exitPoint: MoviesListCoordinatorExitRoutingProtocol
  ) -> MoviesListCoordinatorProtocol {
    let coordinator = MoviesListCoordinator(builder: moviesListCoordinatorComponent)
    coordinator.coordinationExitPoint = exitPoint
    return coordinator
  }

  public func moviesDetailsCoordinator(
    exitPoint: MovieDetailsCoordinatorExitRoutingProtocol
  ) -> MovieDetailsCoordinatorProtocol {
    let coordinator = MovieDetailsCoordinator(builder: movieDetailsCoordinatorComponent)
    coordinator.coordinationExitPoint = exitPoint
    return coordinator
  }
}

// MARK: Components

extension MainFlowCoordinatorDIComponent {}

// MARK: - Interactor

public extension MainFlowCoordinatorDIComponent {
  var interactorDIComponent: MainFlowInteractorDIComponent {
    MainFlowInteractorDIComponent(parent: self)
  }
}

// MARK: - Flow Interactor

public protocol MainFlowInteractorDependency: Dependency {}

public final class MainFlowInteractorDIComponent: Component<MainFlowInteractorDependency> {}

// MARK: - Component

private extension MainFlowCoordinatorDIComponent {
  var moviesListCoordinatorComponent: MoviesListCoordinatorBuilder {
    MoviesListCoordinatorDIComponent(parent: self)
  }

  var movieDetailsCoordinatorComponent: MovieDetailsCoordinatorBuilder {
    MovieDetailsCoordinatorDIComponent(parent: self)
  }
}
