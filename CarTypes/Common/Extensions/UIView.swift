//
//  UIView.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  func pinToSuperview() {
    guard let superview = superview else {
      return
    }
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(
      [
        superview.topAnchor.constraint(equalTo: topAnchor),
        superview.leadingAnchor.constraint(equalTo: leadingAnchor),
        superview.bottomAnchor.constraint(equalTo: bottomAnchor),
        superview.trailingAnchor.constraint(equalTo: trailingAnchor)
      ]
    )
  }
}
