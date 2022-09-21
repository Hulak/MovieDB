//
//  IndexationService.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import CoreSpotlight
import Foundation
import MDBConstants
import MDBUtilities
import MobileCoreServices

public protocol IndexationServiceProtocol {
  func addFirstTimeLaunchIndexesIfNeeded(description: String)
}

public final class IndexationService: IndexationServiceProtocol {
  private let userDefautls: UserDefaultsProtocol

  public init(userDefautls: UserDefaultsProtocol) {
    self.userDefautls = userDefautls
  }

  public func addFirstTimeLaunchIndexesIfNeeded(description: String) {
    guard !userDefautls.bool(forKey: MDBConstants.UserDefaultsKeys.AppInteractor.isFirstAppRun.rawValue) else {
      return
    }

    let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
    attributeSet.title = "MovieDB"
    attributeSet.contentDescription = description
    attributeSet.keywords = [
      "movie",
      "cimena",
      "imdb"
    ]

    let item = CSSearchableItem(
      uniqueIdentifier: "moviedb",
      domainIdentifier: "com.hulak.moviedb",
      attributeSet: attributeSet
    )

    CSSearchableIndex.default().indexSearchableItems([item]) { error in
      if let error = error {
        print("Indexing error: \(error.localizedDescription)")
      } else {
        print("Search item successfully indexed!")
      }
    }
  }
}
