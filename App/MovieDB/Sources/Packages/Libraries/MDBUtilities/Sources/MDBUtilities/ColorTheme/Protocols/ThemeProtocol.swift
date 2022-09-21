//
//  ThemeProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

import SwiftUI
import UIKit

/// @mockable
public protocol ThemeProtocol {
  var images: ImagesThemeProtocol { get }
  var colors: ColorsThemeProtocol { get }
}
