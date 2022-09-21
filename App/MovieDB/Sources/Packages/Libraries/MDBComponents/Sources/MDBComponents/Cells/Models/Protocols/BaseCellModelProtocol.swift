//
//  BaseCellModelProtocol.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

import MDBCommonUI

public protocol BaseCellModelProtocol: CellModelProtocol {
  var title: String? { get set }
  var titleColor: UIColor? { get set }
  var separatorColor: UIColor? { get set }
  var selectionStyle: UITableViewCell.SelectionStyle { get set }
}

public extension BaseCellModelProtocol {
  static var cellHeight: CGFloat {
    53
  }
}
