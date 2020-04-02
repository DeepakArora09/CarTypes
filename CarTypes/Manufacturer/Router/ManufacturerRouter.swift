//
//  ManufacturerRouter.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ManufacturerRouting {
  func listingView() -> ManufacturerViewController
  func showModels(for id: String, name: String, on hostViewController: UIViewController)
}

final class ManufacturerRouter: ManufacturerRouting {

  private let manufacturerControllerProvider: ManufacturerControllerProviding
  private let service: NetworkServicing
  private let modelRouter: ModelRouting

  init(
    manufacturerControllerProvider: ManufacturerControllerProviding,
    service: NetworkServicing,
    modelRouter: ModelRouting
  ) {
    self.manufacturerControllerProvider = manufacturerControllerProvider
    self.service = service
    self.modelRouter = modelRouter
  }

  func listingView() -> ManufacturerViewController {
    return manufacturerControllerProvider.manufacturerViewController(
      service: service,
      router: self
    )
  }

  func showModels(for id: String, name: String, on hostViewController: UIViewController) {
    modelRouter.showModels(for: id, name: name, on: hostViewController)
  }
}
