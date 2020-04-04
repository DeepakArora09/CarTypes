//
//  DataSourceBuilderMock.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CarTypes

struct DataSourceBuilderMock: DataSourceBuilding {
  func buildDataSource(from items: [DomainItem], color: UIColor) -> DataSource {
    return DataSource(sections: [])
  }
}
