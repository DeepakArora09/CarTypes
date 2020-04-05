//
//  ModelPresenter.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ModelPresenting {
  func onViewDidLoad()
  func scrollViewEndDragging(
    with contentHeight: CGFloat,
    viewHeight: CGFloat,
    currentVerticalOffset: CGFloat
  )
  func onDidSelect(item: ViewModel)
}

final class ModelPresenter: ModelPresenting {
  private let interactor: ModelInteracting
  private let dataSourceBuilder: DataSourceBuilding
  private let router: ModelRouting
  private let manufacturerId: String
  private let manufacturerName: String
  private weak var view: ModelView?
  private var model: ResponseDomain?
  private var isLoading = false
  private let paginationDifference: CGFloat = 260

  init(
    view: ModelView,
    interactor: ModelInteracting,
    dataSourceBuilder: DataSourceBuilding,
    router: ModelRouting,
    manufacturerId: String,
    manufacturerName: String
  ) {
    self.view = view
    self.interactor = interactor
    self.dataSourceBuilder = dataSourceBuilder
    self.router = router
    self.manufacturerId = manufacturerId
    self.manufacturerName = manufacturerName
  }

  func onViewDidLoad() {
    view?.setNavigation(title: "Models")
    fetchModel(for: model?.currentPage ?? 0, false)
  }

  func scrollViewEndDragging(
    with contentHeight: CGFloat,
    viewHeight: CGFloat,
    currentVerticalOffset: CGFloat
  ) {
    let difference = contentHeight - (currentVerticalOffset + viewHeight)
    if isLoading == false,
      difference < paginationDifference,
      let model = model,
      model.currentPage < model.totalPages - 1 {
      fetchModel(for: model.currentPage + 1, true)
    }
  }

  func onDidSelect(item: ViewModel) {
    router.showAlert(manufacturer: manufacturerName, model: item.name ?? "", buttonTitle: "OK")
  }
}

// MARK: Fetch Data
private extension ModelPresenter {
  func fetchModel(for page: Int, _ isPaginated: Bool) {
    interactor.fetchModels(
      for: page,
      id: manufacturerId,
      completion: { [weak self] result in
        guard let self = self else {
          return
        }
        switch result {
        case let .success(newModel):
          if isPaginated {
            self.model?.items.append(contentsOf: newModel.items)
            self.model?.currentPage = newModel.currentPage
          } else {
            self.model = newModel
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
private extension ModelPresenter {
  func updateUI() {
    guard let model = model else {
      return
    }
    let dataSource = dataSourceBuilder.buildDataSource(
      from: model.items,
      color: .orange
    )

    DispatchQueue.main.async {
      self.view?.update(dataSource: dataSource)
    }
  }
}
