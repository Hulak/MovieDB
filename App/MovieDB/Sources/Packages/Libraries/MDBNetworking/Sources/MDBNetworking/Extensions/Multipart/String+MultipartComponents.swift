//
//  String+MultipartComponents.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

extension String {
  var mediaType: String {
    components(separatedBy: ".").last ?? ""
  }

  static var boundaryString: String {
    uuidString.lowercased()
  }

  static var uuidString: String {
    UUID().uuidString
  }
}
