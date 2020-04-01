//
//  ManufacturerViewController.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ManufacturerView: AnyObject {
  func update()
}

class ManufacturerViewController: UIViewController {
  var presenter: ManufacturerPresenting?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewDidLoad()
  }
}

extension ManufacturerViewController: ManufacturerView {
  func update() {
  }
}
