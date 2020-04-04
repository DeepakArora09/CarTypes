//
//  DataSourceBuilderTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Nimble
import Quick
@testable import CarTypes

final class DataSourceBuilderTests: QuickSpec {
  override func spec() {
    let builder = DataSourceBuilder()
    it("should map API models correctly") {
      let items = [
        DomainItem(id: "testId1", name: "testName1"),
        DomainItem(id: "testId2", name: "testName2")
      ]

      let dataSource = builder.buildDataSource(from: items, color: .white)
      expect(dataSource.sections.count).to(equal(1))
      expect(dataSource.sections[0].items.count).to(equal(2))
      expect(dataSource.sections[0].items[0].id).to(equal("testId1"))
      expect(dataSource.sections[0].items[1].name).to(equal("testName2"))
      expect(dataSource.sections[0].items[0].color).to(equal(.white))
    }
  }
}
