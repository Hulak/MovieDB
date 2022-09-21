// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {}

  internal enum Colors {
    internal enum Light {
      internal static let aquaBlue = ColorAsset(name: "light/aquaBlue")
      internal static let black = ColorAsset(name: "light/black")
      internal static let blackRock = ColorAsset(name: "light/blackRock")
      internal static let blueberry = ColorAsset(name: "light/blueberry")
      internal static let brightRed = ColorAsset(name: "light/brightRed")
      internal static let byzantium = ColorAsset(name: "light/byzantium")
      internal static let carrotOrange = ColorAsset(name: "light/carrotOrange")
      internal static let chiffon = ColorAsset(name: "light/chiffon")
      internal static let crimson = ColorAsset(name: "light/crimson")
      internal static let darkCharcoal = ColorAsset(name: "light/darkCharcoal")
      internal static let darkGray = ColorAsset(name: "light/darkGray")
      internal static let deepPink = ColorAsset(name: "light/deepPink")
      internal static let deluge = ColorAsset(name: "light/deluge")
      internal static let ebony = ColorAsset(name: "light/ebony")
      internal static let electricPurple = ColorAsset(name: "light/electricPurple")
      internal static let greenTeal = ColorAsset(name: "light/greenTeal")
      internal static let greyChateau = ColorAsset(name: "light/greyChateau")
      internal static let indigo = ColorAsset(name: "light/indigo")
      internal static let lavaRed = ColorAsset(name: "light/lavaRed")
      internal static let magenta = ColorAsset(name: "light/magenta")
      internal static let meteorite = ColorAsset(name: "light/meteorite")
      internal static let navyBlue = ColorAsset(name: "light/navyBlue")
      internal static let nightBlue = ColorAsset(name: "light/nightBlue")
      internal static let purple = ColorAsset(name: "light/purple")
      internal static let purplishBlue = ColorAsset(name: "light/purplishBlue")
      internal static let snowWhite = ColorAsset(name: "light/snowWhite")
      internal static let strawberry = ColorAsset(name: "light/strawberry")
      internal static let vividPink = ColorAsset(name: "light/vividPink")
      internal static let water = ColorAsset(name: "light/water")
      internal static let white = ColorAsset(name: "light/white")
    }
  }
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
    internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
    @available(iOS 11.0, tvOS 11.0, *)
    internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
      let bundle = BundleToken.bundle
      guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
        fatalError("Unable to load color asset named \(name).")
      }
      return color
    }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
      self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
      self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
      self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}

// swiftlint:enable convenience_type
