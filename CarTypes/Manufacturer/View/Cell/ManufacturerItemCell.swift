//
//  ManufacturerItemCell.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

class ManufacturerItemCell: NibLoadableReusableTableCell {
  @IBOutlet private weak var nameLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    nameLabel.textColor = .white
  }

  func update(with viewModel: Any) {
    guard let viewModel = viewModel as? ManufacturerViewModel else {
      return
    }
    nameLabel.text = viewModel.name
    backgroundColor = viewModel.color
  }
}
