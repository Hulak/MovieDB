//
//  TextFieldAlertConfiguration.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

/// TextFieldAlertConfiguration to show alert with text field
public struct TextFieldAlertConfiguration {
  public let title: String?
  public var message: String?
  public var placeholder: String?
  public var handler: AlertRoutableProtocol.AlertTextFieldHandler
  public var cancelHandler: (() -> Void)?

  public init(
    title: String?,
    message: String?,
    placeholder: String?,
    handler: @escaping AlertRoutableProtocol.AlertTextFieldHandler,
    cancelHandler: (() -> Void)? = nil
  ) {
    self.title = title
    self.message = message
    self.placeholder = placeholder
    self.handler = handler
    self.cancelHandler = cancelHandler
  }
}
