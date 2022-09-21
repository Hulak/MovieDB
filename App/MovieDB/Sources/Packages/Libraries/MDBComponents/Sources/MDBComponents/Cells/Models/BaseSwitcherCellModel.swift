//
//  BaseSwitcherCellModel.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

import MDBCommonUI

open class BaseSwitcherCellModel<T>: SwitchCellModelProtocol {
  public static var cellClass: CellProtocol.Type {
    SwitcherCell.self
  }

  public var switchState: Bool = false

  public var title: String?
  public var titleColor: UIColor?
  public var separatorColor: UIColor?
  public var onTint: UIColor?
  @Published public var isOn: Bool = false
  public var isOnPublisher: Published<Bool>.Publisher {
    $isOn
  }

  public var thumbTint: UIColor?
  public var selectionStyle: UITableViewCell.SelectionStyle = .none
  public var type: T

  public init(type: T) {
    self.type = type
  }
}
