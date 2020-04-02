//
//  ManufacturerMapper.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerMapping {
  func manufacturer(from response: ManufactuerApi) -> Manufactuer
}

final class ManufacturerMapper: ManufacturerMapping {
  func manufacturer(from response: ManufactuerApi) -> Manufactuer {
    return Manufactuer(
      totalPages: response.totalPages,
      items: manufacturerItem(from: response.items)
    )
  }

  private func manufacturerItem(from item: [String: String]) -> [ManufactuerItem] {
    return item.keys.map( { return ManufactuerItem(id: $0, name: item[$0]) })
  }
}
