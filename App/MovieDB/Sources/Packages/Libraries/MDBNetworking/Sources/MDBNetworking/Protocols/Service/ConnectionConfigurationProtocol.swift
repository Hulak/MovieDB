//
//  ConnectionConfigurationProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022.
//

public protocol ConnectionConfigurationProtocol {
  var workQueue: DispatchQueue { get }
  var resultQueue: DispatchQueue { get }
}
