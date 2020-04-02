//
//  ReusableView.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
  static var identifier: String { get }
  func update(with viewModel: Any)
}

extension ReusableView {
  static var identifier: String {
    return String(describing: Self.self)
  }
}

protocol NibLoadableView: UIView {
  static var nibName: String { get }
  static var nib: UINib { get }
  func initializeFromNib()
}

extension NibLoadableView {
  static var nibName: String {
    return String(describing: Self.self)
  }

  static var nib: UINib {
    return UINib(nibName: nibName, bundle: Bundle(for: self))
  }

  func initializeFromNib() {
    guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
      return
    }
    addSubview(view)
    view.pinToSuperview()
  }
}
