//
//  LightColors.swift
//  MovieDB
//
//  Created by Alena Hulak on 14.09.2022.
//

import MDBUtilities

/// Standard light theme colors
struct LightColors: ColorsThemeProtocol {
  let main: MainColorsThemeProtocol = LightMainColors()
  let components: ComponentsColorsThemeProtocol = LightComponents()
}
