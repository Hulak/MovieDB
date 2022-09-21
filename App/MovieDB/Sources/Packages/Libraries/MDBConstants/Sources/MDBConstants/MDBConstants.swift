import Foundation
import Network

public enum MDBConstants {
  public enum UserDefaultsKeys {
    public enum AppInteractor: String {
      case hasLoggedInBeforeKey
      case isFirstAppRun
    }

    public enum BundleSettings: String {
      case environment
    }

    public enum UserPreferences: String {
      case notificationsEnabled
      case analyticsEnabled
    }
  }

  public enum NotificationInfo {
    public static let badgeKey = "badge"
  }

  public static let ApiKey = "07f6d68cb2e9630f397607612c443f61"

  public enum Keychain: String {
    case service = "com.hulak.moviedb.keychainService"
    case group = "com.hulak.moviedb.keychainGroup"
  }

  public enum DateFormats {
    public static let format24h = "YYYY.MM.dd HH:mm"
    public static let formatA = "YYYY.MM.dd HH:mm a"
  }

  public enum UpdateApp {
    public static func testFlight() -> URL? {
      URL(string: "https://testflight.apple.com/v1/app/???")
    }

    public static func appStore() -> URL? {
      URL(string: "https://apps.apple.com/app/???")
    }
  }
}
