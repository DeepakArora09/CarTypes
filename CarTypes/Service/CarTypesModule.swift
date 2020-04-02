//
//  CarTypesModule.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

class CarTypesModule {
  private let manufacturerRouter: ManufacturerRouting
  private let network = NetworkService()

  init() {
    self.manufacturerRouter = ManufacturerRouter(
      manufacturerControllerProvider: ManufacturerControllerProvider(),
      service: network,
      modelRouter: ModelRouter(
        modelControllerProvider: ModelControllerProvider(),
        service: network
      )
    )
  }

  var initialViewController: UIViewController {
    return manufacturerRouter.listingView()
  }
}
