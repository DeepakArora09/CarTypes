//
//  ManufacturerPresenterTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CarTypes

final class ManufacturerViewMock: ManufacturerView {
  var updateDataSourceCalled = false
  var setNavigationTitleCalled = false

  func update(dataSource: DataSource) {
    updateDataSourceCalled = true
  }

  func setNavigation(title: String) {
    setNavigationTitleCalled = true
  }
}

final class ManufacturerRouterMock: ManufacturerRouting {
  var listingView: UIViewController {
    return UIViewController()
  }

  func showModels(for id: String, name: String, on hostViewController: UIViewController) {
  }
}

final class ManufacturerInteractorMock: ManufacturerInteracting {
  func fetchManufacturers(
    for page: Int,
    completion: @escaping (Result<ResponseDomain, Error>) -> Void
  ) {
    completion(.success(ResponseDomain(currentPage: 0, totalPages: 0, items: [])))
  }
}

final class ManufacturerPresenterTests: QuickSpec {
  override func spec() {
    // swiftlint:disable implicitly_unwrapped_optional
    var view: ManufacturerViewMock!
    var presenter: ManufacturerPresenting!
    // swiftlint:enable implicitly_unwrapped_optional

    beforeEach {
      view = ManufacturerViewMock()
      presenter = ManufacturerPresenter(
        view: view,
        interactor: ManufacturerInteractorMock(),
        dataSourceBuilder: DataSourceBuilderMock(),
        router: ManufacturerRouterMock()
      )
    }

    context("When coming to the screen for the first time") {
      it("should not call any view updates before informing presenter") {
        expect(view.setNavigationTitleCalled).to(be(false))
        waitUntil(timeout: 2) { done in
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expect(view.updateDataSourceCalled).to(be(false))
            done()
          }
        }
      }

      it("should call normal view updates after informing presenter") {
        presenter.onViewDidLoad()
        expect(view.setNavigationTitleCalled).to(be(true))
        waitUntil(timeout: 2) { done in
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expect(view.updateDataSourceCalled).to(be(true))
            done()
          }
        }
      }
    }
  }
}
