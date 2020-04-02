//
//  ManufacturerDataSourceBuilder.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerDataSourceBuilding {
  func buildDataSource(from items: [ManufactuerItem]) -> ManufacturerDataSource
}

final class ManufacturerDataSourceBuilder: ManufacturerDataSourceBuilding {
  func buildDataSource(from items: [ManufactuerItem]) -> ManufacturerDataSource {
    let viewModels = items.enumerated().map({ index, item in
      ManufacturerViewModel(
        name: item.name,
        color: index % 2 == 0 ? .lightGray : .gray
      )
    })

    let sections = [
      ManufacturerSection(
        cellType: ManufacturerItemCell.self,
        items: viewModels
      )
    ]
    return ManufacturerDataSource(sections: sections)
  }
}
