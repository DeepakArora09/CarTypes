//
//  ManufacturerPresenter.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerPresenting {
  func onViewDidLoad()
}

final class ManufacturerPresenter: ManufacturerPresenting {
  private let interactor: ManufacturerInteracting
  private let dataSourceBuilder: ManufacturerDataSourceBuilding
  private weak var view: ManufacturerView?
  private var manufacturer: Manufactuer?

  init(
    view: ManufacturerView,
    interactor: ManufacturerInteracting,
    dataSourceBuilder: ManufacturerDataSourceBuilding
  ) {
    self.view = view
    self.interactor = interactor
    self.dataSourceBuilder = dataSourceBuilder
  }

  func onViewDidLoad() {
    interactor.fetchInitialManufacturers(completion: { [weak self] result in
      guard let self = self else {
        return
      }
      switch result {
      case let .success(manufacturer):
        self.manufacturer = manufacturer
        self.updateUI()
      case .failure:
        break
      }
    })
  }
}

// MARK: Update View
private extension ManufacturerPresenter {
  func updateUI() {
    guard let manufacturer = manufacturer else {
      return
    }

    let dataSource = dataSourceBuilder.buildDataSource(from: manufacturer.items)
    print(dataSource)
  }
}
