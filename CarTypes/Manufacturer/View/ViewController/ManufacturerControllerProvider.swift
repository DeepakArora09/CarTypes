//
//  ManufacturerControllerProvider.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ManufacturerControllerProviding {
  var manufacturerViewController: ManufacturerViewController { get }
}

final class ManufacturerControllerProvider: ManufacturerControllerProviding {
  var manufacturerViewController: ManufacturerViewController {
    guard let viewController = manufacturerStoryboard.instantiateViewController(
      withIdentifier: "ManufacturerViewController"
    ) as? ManufacturerViewController else {
      fatalError("ManufacturerViewController cannot init from storyboard")
    }

    return viewController
  }

  private var manufacturerStoryboard: UIStoryboard {
    return UIStoryboard(
      name: "Manufacturer", bundle: Bundle(for: ManufacturerViewController.self)
    )
  }
}
