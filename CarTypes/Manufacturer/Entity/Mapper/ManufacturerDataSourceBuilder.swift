//
//  ManufacturerDataSourceBuilder.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol DataSourceBuilding {
  func buildDataSource(from items: [DomainItem]) -> DataSource
}

final class DataSourceBuilder: DataSourceBuilding {
  func buildDataSource(from items: [DomainItem]) -> DataSource {
    let viewModels = items.enumerated().map({ index, item in
      ViewModel(
        id: item.id,
        name: item.name,
        color: index % 2 == 0 ? .lightGray : .gray
      )
    })

    let sections = [
      DataSourceSection(
        cellType: ManufacturerItemCell.self,
        items: viewModels
      )
    ]
    return DataSource(sections: sections)
  }
}
