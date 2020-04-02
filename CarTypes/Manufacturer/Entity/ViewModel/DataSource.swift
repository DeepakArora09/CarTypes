//
//  DataSource.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

struct DataSource {
  let sections: [DataSourceSection]
}

struct DataSourceSection {
  let cellType: ReusableView.Type
  let items: [ViewModel]
  let cellHeight: CGFloat = 80
}

struct ViewModel {
  let id: String
  let name: String?
  let color: UIColor
}
