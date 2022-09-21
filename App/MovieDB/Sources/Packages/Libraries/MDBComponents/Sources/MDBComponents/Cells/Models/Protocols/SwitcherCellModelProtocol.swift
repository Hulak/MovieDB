//
//  SwitchCellModelProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

import Combine
import MDBCommonUI

public protocol SwitchCellModelProtocol: BaseCellModelProtocol {
  var onTint: UIColor? { get set }
  var thumbTint: UIColor? { get set }
  var isOnPublisher: Published<Bool>.Publisher { get }
}
