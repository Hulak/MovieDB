//
//  Theme.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation
import MDBUtilities

/// Standard light theme
struct LightTheme: ThemeProtocol {
  let images: ImagesThemeProtocol = LightImages()
  let colors: ColorsThemeProtocol = LightColors()
}
