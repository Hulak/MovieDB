//
//  BaseActionCellModel.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

import MDBCommonUI

open class BaseActionCellModel<T>: CellModelProtocol, ActionCellModelProtocol {
  public static var cellClass: CellProtocol.Type {
    ActionCell.self
  }

  public var arrowImage: UIImage?
  public var arrowColor: UIColor?
  public var title: String?
  public var titleColor: UIColor?
  public var actionTitle: String?
  public var actionColor: UIColor?
  public var separatorColor: UIColor?
  public var selectionStyle: UITableViewCell.SelectionStyle = .none
  public var isArrowHidden: Bool = false
  public var type: T

  public init(type: T) {
    self.type = type
  }
}
