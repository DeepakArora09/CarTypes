//
//  ParsingTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Nimble
import Quick

@testable import CarTypes

final class CarTypesParsingTests: QuickSpec {
  override func spec() {
    it("Should parse `ResponseApi` correctly") {
      do {
        let response: ResponseApi = try mockResponse(fromJSONFile: .validResponse)
        expect(response.items.keys.count).to(beGreaterThan(0))
        expect(response.totalPages).to(beGreaterThan(0))
      } catch {
        fail("\(error)")
      }
    }

    it("Should not parse `ResponseApi`") {
      do {
        let _: ResponseApi = try mockResponse(fromJSONFile: .invalidResponse)
      } catch {
        expect(error).toNot(beNil())
      }
    }
  }
}
