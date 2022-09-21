//
//  DarkTheme.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022.
//

import Foundation
import MDBUtilities

/// Standard dark theme
struct DarkTheme: ThemeProtocol {
  let images: ImagesThemeProtocol = DarkImages()
  let colors: ColorsThemeProtocol = DarkColors()
}
