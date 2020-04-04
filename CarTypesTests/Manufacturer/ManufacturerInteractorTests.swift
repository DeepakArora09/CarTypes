//
//  ManufacturerInteractorTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CarTypes

final class ManufacturerInteractorTests: QuickSpec {
  override func spec() {
    let interactor = ManufacturerInteractor(service: NetworkServiceMock(), mapper: MapperMock())
    context("When fetching manufatureres") {
      it("should receive response") {
        waitUntil(timeout: 5) { done in
          interactor.fetchManufacturers(
            for: 0,
            completion: { response in
              switch response {
              case let .success(manufacturers):
                expect(manufacturers.items.count).toNot(be(0))
              case let .failure(error):
                fail("fetch manufactuers failed \(error)")
              }
              done()
            }
          )
        }
      }
    }
  }
}
