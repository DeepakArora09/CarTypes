//
//  ManufacturerMapper.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol Mapping {
  func domain(from response: ResponseApi) -> ResponseDomain
}

final class Mapper: Mapping {
  func domain(from response: ResponseApi) -> ResponseDomain {
    return ResponseDomain(
      currentPage: response.currentPage,
      totalPages: response.totalPages,
      items: domainItem(from: response.items)
    )
  }

  private func domainItem(from item: [String: String]) -> [DomainItem] {
    return item.keys.map( { return DomainItem(id: $0, name: item[$0]) })
  }
}
