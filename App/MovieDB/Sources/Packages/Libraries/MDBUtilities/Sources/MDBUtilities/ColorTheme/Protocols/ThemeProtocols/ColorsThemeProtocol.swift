//
//  ColorsThemeProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import MDBCommonUI
import SwiftUI
import UIKit

// MARK: - Colors

/// @mockable
public protocol ColorsThemeProtocol {
  var main: MainColorsThemeProtocol { get }
  var components: ComponentsColorsThemeProtocol { get }
}
