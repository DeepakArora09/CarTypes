//
//  ManufacturerControllerProvider.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ManufacturerControllerProviding {
  func manufacturerViewController(service: NetworkServicing) -> ManufacturerViewController
}

final class ManufacturerControllerProvider: ManufacturerControllerProviding {
  func manufacturerViewController(service: NetworkServicing) -> ManufacturerViewController {
    guard let viewController = manufacturerStoryboard.instantiateViewController(
      withIdentifier: "ManufacturerViewController"
    ) as? ManufacturerViewController else {
      fatalError("ManufacturerViewController cannot init from storyboard")
    }

    let interactor = ManufacturerInteractor(service: service, mapper: ManufacturerMapper())
    let presenter = ManufacturerPresenter(
      view: viewController,
      interactor: interactor,
      dataSourceBuilder: ManufacturerDataSourceBuilder()
    )

    viewController.presenter = presenter
    return viewController
  }

  private var manufacturerStoryboard: UIStoryboard {
    return UIStoryboard(name: "Manufacturer", bundle: Bundle(for: ManufacturerViewController.self))
  }
}
