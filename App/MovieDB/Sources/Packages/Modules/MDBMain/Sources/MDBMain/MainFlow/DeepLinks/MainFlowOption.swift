//
//  MainFlowOption.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022
//
//

import Foundation
import MDBCommonUI
import MDBModels

public enum MainFlowOption: DeepLinkOptionProtocol {
  case moviesList
  case movieDetails(MovieDetailsOption)

  case end
}

public struct MovieDetailsOption: DeepLinkOptionProtocol {
  let model: MovieRuntimeModel
}
