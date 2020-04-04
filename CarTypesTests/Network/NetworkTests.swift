//
//  NetworkTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Nimble
import Quick

@testable import CarTypes

final class NetworkClientTests: QuickSpec {
  private let client = NetworkService()

  override func spec() {
    it("should fetch manufacturers") {
      waitUntil(timeout: 10) { done in
        self.client.request(
          router: .getManufacturers(page: 0, size: 1)
        ) { (response: ResponseApi, error: Error?)  in
          if error != nil {
            fail("api failed")
          } else {
            expect(response.items).notTo(beNil())
            expect(response.items.keys.count).to(beGreaterThan(0))
          }
          done()
        }
      }
    }

    it("should fetch models") {
      waitUntil(timeout: 10) { done in
        self.client.request(
          router: .getMainTypes(manufacturerId: "107", page: 0, size: 1)
        ) { (response: ResponseApi, error: Error?)  in
          if error != nil {
            fail("api failed")
          } else {
            expect(response.items).notTo(beNil())
            expect(response.items.keys.count).to(beGreaterThan(0))
          }
          done()
        }
      }
    }
  }
}
