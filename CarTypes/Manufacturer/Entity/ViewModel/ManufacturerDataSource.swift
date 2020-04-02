//
//  ManufacturerDataSource.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

struct ManufacturerDataSource {
  let sections: [ManufacturerSection]
}

struct ManufacturerSection {
  let cellType: ReusableView.Type
  let items: [ManufacturerViewModel]
  let cellHeight: CGFloat = 80
}

struct ManufacturerViewModel {
  let name: String?
  let color: UIColor
}
