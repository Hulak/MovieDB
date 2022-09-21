//
//  MoviesListDI.swift
//
//
//  Created by Alena Hulak on 13.09.2022.
//

import MDBCommonUI
import MDBDataLayer
import MDBServices
import MDBUtilities
import NeedleFoundation

// MARK: Module

/// MoviesList module model
public typealias MoviesList = Module<MoviesListModuleInput, MoviesListModuleOutput>

// MARK: Module's coordinator

/// Module's coordinator builder
public protocol MoviesListCoordinatorBuilder: ModuleBuilder {
  func moduleMoviesList(output: MoviesListModuleOutput?,
                        routingHandler: MoviesListRoutingHandlingProtocol) -> MoviesList
}

/// Module coordinator DI component
public final class MoviesListCoordinatorDIComponent: Component<EmptyDependency>,
  MoviesListCoordinatorBuilder
{
  public func moduleMoviesList(output: MoviesListModuleOutput?,
                               routingHandler: MoviesListRoutingHandlingProtocol) -> MoviesList
  {
    // View
    let view = MoviesListViewController()

    // Interactor
    let interactor = MoviesListInteractor(dependency: interactorDIComponent.dependency)

    // Presenter
    let presenter = MoviesListPresenter(dependency: presenterDIComponent.dependency)
    presenter.view = view

    // Dependency Setup
    view.interactor = interactor
    view.routingHandler = routingHandler
    interactor.presenter = presenter

    return Module(view: view, input: presenter, output: output)
  }

  var interactorDIComponent: MoviesListInteractorDIComponent {
    MoviesListInteractorDIComponent(parent: self)
  }

  var presenterDIComponent: MoviesListPresenterDIComponent {
    MoviesListPresenterDIComponent(parent: self)
  }
}

// MARK: Module's interactor

/// Module interactor dependencies
/// @mockable
public protocol MoviesListInteractorDependency: Dependency {
//  var dataInteractor: DataInteractorProtocol { get }
  var networkingProvider: NetworkingProviderProtocol { get }
  var saveImagesService: ImageSaveServiceProtocol { get }
  var databaseService: DatabaseServiceProtocol { get }
}

/// Module interactor DI component
final class MoviesListInteractorDIComponent: Component<MoviesListInteractorDependency> {}

// MARK: Module's presenter

/// Module presenter dependencies
/// @mockable
public protocol MoviesListPresenterDependency: Dependency {
  var themeManager: ThemeManagerProtocol { get }
  var localizer: LocalizerProtocol { get }
}

/// Module presenter DI component
final class MoviesListPresenterDIComponent: Component<MoviesListPresenterDependency> {}
