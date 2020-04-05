//
//  ManufacturerRouter.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import UIKit

protocol ManufacturerRouting: AnyObject {
  func showModels(for id: String, name: String)
}

final class ManufacturerRouter: NSObject {
  private weak var viewController: ManufacturerViewController?

  static func createModule() -> UIViewController {
    let view = ManufacturerControllerProvider().manufacturerViewController
    let interactor = ManufacturerInteractor(service: NetworkService.shared, mapper: Mapper())
    let router = ManufacturerRouter()
    let presenter = ManufacturerPresenter(
      view: view,
      interactor: interactor,
      dataSourceBuilder: DataSourceBuilder(),
      router: router
    )
    view.presenter = presenter
    router.viewController = view
    return view
  }
}

extension ManufacturerRouter: ManufacturerRouting {
  func showModels(for id: String, name: String) {
    viewController?.navigationController?.pushViewController(
      ModelRouter.createModule(id: id, name: name),
      animated: true
    )
  }
}
