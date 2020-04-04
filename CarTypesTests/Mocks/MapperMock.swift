//
//  MapperMock.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CarTypes

struct MapperMock: Mapping {
  func domain(from response: ResponseApi) -> ResponseDomain {
    return ResponseDomain(currentPage: 0, totalPages: 1, items: [DomainItem(id: "test_id", name: "test_name")])
  }
}
