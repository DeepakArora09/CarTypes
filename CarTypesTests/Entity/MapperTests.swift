//
//  MapperTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Nimble
import Quick
@testable import CarTypes

final class MapperTests: QuickSpec {
  override func spec() {
    let mapper = Mapper()

    it("should map API models correctly") {
      let response = ResponseApi(
        currentPage: 0,
        totalPages: 1,
        items: ["124 Spider": "124 Spider", "500": "500", "500C": "500C", "595": "595"]
      )

      let domain = mapper.domain(from: response)
      expect(domain.currentPage).to(equal(0))
      expect(domain.totalPages).to(equal(1))
      expect(domain.items.count).to(equal(4))
      expect(domain.items[0].id).to(equal("124 Spider"))
      expect(domain.items[1].name).to(equal("500"))
    }
  }
}
