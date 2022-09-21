//
//  MovieDetailsDI.swift
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

/// MovieDetails module model
public typealias MovieDetails = Module<MovieDetailsModuleInput, MovieDetailsModuleOutput>

// MARK: Module's coordinator

/// Module's coordinator builder
public protocol MovieDetailsCoordinatorBuilder: ModuleBuilder {
  func moduleMovieDetails(output: MovieDetailsModuleOutput?,
                          routingHandler: MovieDetailsRoutingHandlingProtocol) -> MovieDetails
}

/// Module coordinator DI component
public final class MovieDetailsCoordinatorDIComponent: Component<EmptyDependency>,
  MovieDetailsCoordinatorBuilder
{
  public func moduleMovieDetails(output: MovieDetailsModuleOutput?,
                                 routingHandler: MovieDetailsRoutingHandlingProtocol) -> MovieDetails
  {
    // View
    let view = MovieDetailsViewController()

    // Interactor
    let interactor = MovieDetailsInteractor(dependency: interactorDIComponent.dependency)

    // Presenter
    let presenter = MovieDetailsPresenter(dependency: presenterDIComponent.dependency)
    presenter.view = view

    // Dependency Setup
    view.interactor = interactor
    view.routingHandler = routingHandler
    interactor.presenter = presenter

    return Module(view: view, input: presenter, output: output)
  }

  var interactorDIComponent: MovieDetailsInteractorDIComponent {
    MovieDetailsInteractorDIComponent(parent: self)
  }

  var presenterDIComponent: MovieDetailsPresenterDIComponent {
    MovieDetailsPresenterDIComponent(parent: self)
  }
}

// MARK: Module's interactor

/// Module interactor dependencies
/// @mockable
public protocol MovieDetailsInteractorDependency: Dependency {
//  var dataInteractor: DataInteractorProtocol { get }
  var networkingProvider: NetworkingProviderProtocol { get }
  var saveImagesService: ImageSaveServiceProtocol { get }
}

/// Module interactor DI component
final class MovieDetailsInteractorDIComponent: Component<MovieDetailsInteractorDependency> {}

// MARK: Module's presenter

/// Module presenter dependencies
/// @mockable
public protocol MovieDetailsPresenterDependency: Dependency {
  var themeManager: ThemeManagerProtocol { get }
  var localizer: LocalizerProtocol { get }
}

/// Module presenter DI component
final class MovieDetailsPresenterDIComponent: Component<MovieDetailsPresenterDependency> {}
