//
//  ModelRouter.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ModelRouting {
  func showModels(for id: String, name: String, on hostViewController: UIViewController)
}

final class ModelRouter: ModelRouting {
  private let modelControllerProvider: ModelControllerProviding
  private let service: NetworkServicing

  init(modelControllerProvider: ModelControllerProviding, service: NetworkServicing) {
    self.modelControllerProvider = modelControllerProvider
    self.service = service
  }

  func showModels(for id: String, name: String, on hostViewController: UIViewController) {
    let viewController = modelControllerProvider.modelViewController(
      for: id,
      name: name,
      service: service,
      router: self
    )
    hostViewController.present(viewController, animated: true, completion: nil)
  }
}

