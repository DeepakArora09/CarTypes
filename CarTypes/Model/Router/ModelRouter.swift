//
//  ModelRouter.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ModelRouting: AnyObject {
  func showAlert(manufacturer: String, model: String, buttonTitle: String)
}

final class ModelRouter {
  private weak var viewController: ModelViewController?

  static func createModule(id: String, name: String) -> UIViewController {
    let view = ModelControllerProvider().modelViewController
    let interactor = ModelInteractor(service: NetworkService.shared, mapper: Mapper())
    let router = ModelRouter()
    let presenter = ModelPresenter(
      view: view,
      interactor: interactor,
      dataSourceBuilder: DataSourceBuilder(),
      router: router,
      manufacturerId: id,
      manufacturerName: name
    )

    view.presenter = presenter
    router.viewController = view
    return view
  }
}

extension ModelRouter: ModelRouting {
  func showAlert(manufacturer: String, model: String, buttonTitle: String) {
    let alert = UIAlertController(title: manufacturer, message: model, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
    viewController?.present(alert, animated: true)
  }
}
