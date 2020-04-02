//
//  NetworkRouter.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

enum NetworkRouter {
  case getManufacturers(page: Int, size: Int)
  case getMainTypes(manufacturerId: String, page: Int, size: Int)

  var accessToken: String {
    return "coding-puzzle-client-449cc9d"
  }

  var scheme: String {
    switch self {
    case .getManufacturers, .getMainTypes:
        return "https"
    }
  }

  var host: String {
    let base = "api-aws-eu-qa-1.auto1-test.com"
    switch self {
    case .getManufacturers, .getMainTypes:
        return base
    }
  }

  var path: String {
    switch self {
    case .getManufacturers:
        return "/v1/car-types/manufacturer"
    case .getMainTypes:
        return "/v1/car-types/main-types"
    }
  }

  var parameters: [URLQueryItem] {
    switch self {
    case .getManufacturers(let page, let size):
      return commonQueryItems(for: page, size: size)
    case .getMainTypes(let manufacturerId, let page, let size):
      var commonItems = commonQueryItems(for: page, size: size)
      commonItems.append(URLQueryItem(name: "manufacturer", value: manufacturerId))
      return commonItems
    }
  }

  var method: String {
    switch self {
    case .getManufacturers, .getMainTypes:
        return "GET"
    }
  }

  private func commonQueryItems(for page: Int, size: Int) -> [URLQueryItem] {
    return [
      URLQueryItem(name: "page", value: "\(page)"),
      URLQueryItem(name: "pageSize", value: "\(size)"),
      URLQueryItem(name: "wa_key", value: accessToken)
    ]
  }
}
