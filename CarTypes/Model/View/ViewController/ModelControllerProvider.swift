//
//  ModelControllerProvider.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import UIKit

protocol ModelControllerProviding {
  func modelViewController(
    for id: String,
    name: String,
    service: NetworkServicing,
    router: ModelRouting
  ) -> ModelViewController
}

final class ModelControllerProvider: ModelControllerProviding {
  func modelViewController(
    for id: String,
    name: String,
    service: NetworkServicing,
    router: ModelRouting
  ) -> ModelViewController{
    guard let viewController = modelStoryboard.instantiateViewController(
      withIdentifier: "ModelViewController"
    ) as? ModelViewController else {
      fatalError("ModelViewController cannot init from storyboard")
    }

    let interactor = ModelInteractor(service: service, mapper: Mapper())
    let presenter = ModelPresenter(
      view: viewController,
      interactor: interactor,
      dataSourceBuilder: DataSourceBuilder(),
      router: router,
      manufacturerId: id,
      manufacturerName: name
    )

    viewController.presenter = presenter
    return viewController
  }

  private var modelStoryboard: UIStoryboard {
    return UIStoryboard(name: "Model", bundle: Bundle(for: ModelViewController.self))
  }
}

