//
//  CarTypesModule.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

class CarTypesModule {
  var initialViewController: UINavigationController {
    return UINavigationController(rootViewController: ManufacturerRouter.createModule())
  }
}
