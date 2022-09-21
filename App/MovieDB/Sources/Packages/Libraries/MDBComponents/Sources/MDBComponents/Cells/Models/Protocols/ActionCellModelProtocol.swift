//
//  ActionCellModel.swift
//
//
//  Created by Alena Hulak on 14.09.2022
//

import MDBCommonUI

public protocol ActionCellModelProtocol: BaseCellModelProtocol {
  var arrowImage: UIImage? { get set }
  var arrowColor: UIColor? { get set }
  var actionTitle: String? { get set }
  var actionColor: UIColor? { get set }
  var isArrowHidden: Bool { get set }
}
