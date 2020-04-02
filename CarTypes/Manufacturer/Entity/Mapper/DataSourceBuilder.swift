//
//  DataSourceBuilder.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol DataSourceBuilding {
  func buildDataSource(from items: [DomainItem], color: UIColor) -> DataSource
}

final class DataSourceBuilder: DataSourceBuilding {
  func buildDataSource(from items: [DomainItem], color: UIColor) -> DataSource {
    let viewModels = items.enumerated().map({ index, item in
      ViewModel(
        id: item.id,
        name: item.name,
        color: index % 2 == 0 ? color : color.withAlphaComponent(0.6)
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
