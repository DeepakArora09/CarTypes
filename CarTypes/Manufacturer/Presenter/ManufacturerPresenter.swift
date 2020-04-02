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
  private weak var view: ManufacturerView?

  init(view: ManufacturerView, interactor: ManufacturerInteracting) {
    self.view = view
    self.interactor = interactor
  }

  func onViewDidLoad() {
    interactor.fetchInitialManufacturers(completion: { result in
      switch result {
      case let .success(manufacturer):
        print("from presenter")
        print(manufacturer)
      case .failure:
        break
      }
    })
  }
}
