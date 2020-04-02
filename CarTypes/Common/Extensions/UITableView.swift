//
//  UITableView.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

typealias ReusableTableCell = UITableViewCell & ReusableView
typealias NibLoadableReusableTableCell = ReusableTableCell & NibLoadableView

extension UITableView {
  func registerNibForCell(_ type: NibLoadableReusableTableCell.Type) {
    register(type.nib, forCellReuseIdentifier: type.identifier)
  }

  func dequeueReusableCell(ofType type: ReusableView.Type, for indexPath: IndexPath) -> ReusableTableCell {
    guard let cell = dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? ReusableTableCell else {
      fatalError("no cell registered with \(type.identifier)")
    }
    return cell
  }
}
