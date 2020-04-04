//
//  NetworkMocks.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 04.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import CarTypes

struct NetworkServiceMock: NetworkServicing {
  func request<T: Codable>(router: NetworkRouter, completion: @escaping (_: T, _: Error?) -> Void) {
    switch router {
    case .getManufacturers:
      guard let response = ResponseApi(currentPage: 0, totalPages: 1, items: ["020": "Abarth"]) as? T else {
        return
      }
      completion(
        response,
        nil
      )
    case .getMainTypes:
      guard let response = ResponseApi(currentPage: 0, totalPages: 1, items: ["124 Spider": "124 Spider"]) as? T else {
        return
      }
      completion(
        response,
        nil
      )
    }
  }
}
