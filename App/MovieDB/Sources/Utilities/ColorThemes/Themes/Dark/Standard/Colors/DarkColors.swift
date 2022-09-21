//
//  DarkColors.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022.
//

import MDBUtilities

/// Standard dark theme colors
struct DarkColors: ColorsThemeProtocol {
  let main: MainColorsThemeProtocol = DarkMainColors()
  let components: ComponentsColorsThemeProtocol = DarkComponents()
}
