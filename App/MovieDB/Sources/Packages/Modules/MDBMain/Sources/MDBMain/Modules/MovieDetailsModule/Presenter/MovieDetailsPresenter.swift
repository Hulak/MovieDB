//
//  MovieDetailsPresenter.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022
//
//

import Foundation
import MDBCommonUI
import MDBComponents
import MDBModels
import MDBUtilities

final class MovieDetailsPresenter: PresenterProtocol {
  weak var view: MovieDetailsViewInput?
  var moduleOutput: MovieDetailsModuleOutput?

  private let stateMachine: MovieDetailsStateMachine
  private let localizer: LocalizerProtocol
  private let themesManager: ThemeManagerProtocol
  var alertActions: [StateMachineAlertStateActionType] {
    [
      StateMachineAlertStateDefaultAction(
        title: localizer.l10n.Button.ok
      )
    ]
  }

  private var subscriptions: Set<AnyCancellable> = []

  init(
    initialState: MovieDetailsState = .default(completion: nil),
    dependency: MovieDetailsPresenterDependency
  ) {
    stateMachine = MovieDetailsStateMachine(state: initialState)
    localizer = dependency.localizer
    themesManager = dependency.themeManager
  }
}

// MARK: Private

extension MovieDetailsPresenter {
  private func subscribeOnThemePublisher() {}

  private func subscribeOnStatePublisher() {
    stateMachine.onStateChangePublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] state in
        self?.view?.setupWith(state: state)
      }
      .store(in: &subscriptions)
  }

  private func localizeView() {
    view?.localize(with: localizer.l10n)
  }
}

// MARK: Module Input

extension MovieDetailsPresenter: MovieDetailsModuleInput {
  func setup(movieModel: MovieRuntimeModel) {
    view?.setup(movieModel: movieModel)
  }
}

// MARK: Interactor Output

extension MovieDetailsPresenter: MovieDetailsPresenterInput {
  func update(image: UIImage) {
    view?.update(image: image)
  }

  func interactorDidLoad() {
    subscribeOnThemePublisher()
    subscribeOnStatePublisher()
    localizeView()
  }

  func handle(state: MovieDetailsState) {
    stateMachine.changeStateIfNeeded(to: state)
  }

  func handleOnLoadingState() {
    let loadingState = MovieDetailsState.onLoading(
      .init(loadingText: localizer.l10n.ActivityIndicator.onLoadingTitle)
    )
    handle(state: loadingState)
  }

  func handleAlertStateWith(error: Error) {
    let configuration = AlertConfiguration(
      message: error.localizedDescription,
      actions: alertActions(with: alertActions)
    )
    let errorState = MovieDetailsState.onError([
      .alert(configuration: configuration)
    ])
    handle(state: errorState)
  }
}
