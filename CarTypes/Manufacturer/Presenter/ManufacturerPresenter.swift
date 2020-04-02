//
//  ManufacturerPresenter.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ManufacturerPresenting {
  func onViewDidLoad()
  func scrollViewEndDragging(
    with contentHeight: CGFloat,
    viewHeight: CGFloat,
    currentVerticalOffset: CGFloat
  )
}

final class ManufacturerPresenter: ManufacturerPresenting {
  private let interactor: ManufacturerInteracting
  private let dataSourceBuilder: ManufacturerDataSourceBuilding
  private weak var view: ManufacturerView?
  private var manufacturer: Manufactuer?
  private var isLoading = false
  private let paginationDifference: CGFloat = 260

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
    fetchManufacturer(page: manufacturer?.currentPage ?? 0, false)
  }

  func scrollViewEndDragging(
    with contentHeight: CGFloat,
    viewHeight: CGFloat,
    currentVerticalOffset: CGFloat
  ) {
    let difference = contentHeight - (currentVerticalOffset + viewHeight)
    if isLoading == false,
      difference < paginationDifference,
      let manufacturer = manufacturer,
      manufacturer.currentPage < manufacturer.totalPages - 1 {
      fetchManufacturer(page: manufacturer.currentPage + 1, true)
    }
  }
}

// MARK: Fetch Data
private extension ManufacturerPresenter {
  func fetchManufacturer(page: Int, _ isPaginated: Bool) {
    interactor.fetchInitialManufacturers(
      for: page,
        completion: { [weak self] result in
        guard let self = self else {
          return
        }
        switch result {
        case let .success(newManufacturer):
          print(newManufacturer.items.map( {$0.name }))
          if isPaginated {
            self.manufacturer?.items.append(contentsOf: newManufacturer.items)
            self.manufacturer?.currentPage = newManufacturer.currentPage
          } else {
            self.manufacturer = newManufacturer
          }
          self.updateUI()
        case .failure:
          break
        }
      }
    )
  }
}

// MARK: Update View
private extension ManufacturerPresenter {
  func updateUI() {
    guard let manufacturer = manufacturer else {
      return
    }
    let dataSource = dataSourceBuilder.buildDataSource(from: manufacturer.items)
    DispatchQueue.main.async {
      self.view?.update(dataSource: dataSource)
    }
  }
}
