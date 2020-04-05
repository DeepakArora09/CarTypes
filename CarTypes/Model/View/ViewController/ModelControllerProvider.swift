//
//  ModelControllerProvider.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ModelControllerProviding {
  var modelViewController: ModelViewController { get }
}

final class ModelControllerProvider: ModelControllerProviding {
  var modelViewController: ModelViewController {
    guard let viewController = modelStoryboard.instantiateViewController(
      withIdentifier: "ModelViewController"
    ) as? ModelViewController else {
      fatalError("ModelViewController cannot init from storyboard")
    }

    return viewController
  }

  private var modelStoryboard: UIStoryboard {
    return UIStoryboard(name: "Model", bundle: Bundle(for: ModelViewController.self))
  }
}
