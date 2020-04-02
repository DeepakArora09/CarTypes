//
//  ManufacturerInteractor.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerInteracting {
  func fetchInitialManufacturers(
    for page: Int,
    completion: @escaping (Result<Manufactuer, Error>) -> Void
  )
}

final class ManufacturerInteractor: ManufacturerInteracting {
  private let mapper: ManufacturerMapping
  private let service: NetworkServicing
  private let limit = 15

  init(service: NetworkServicing, mapper: ManufacturerMapping) {
    self.service = service
    self.mapper = mapper
  }

  func fetchInitialManufacturers(
    for page: Int,
    completion: @escaping (Result<Manufactuer, Error>) -> Void
  ) {
    service.request(router: .getManufacturers(page: page, size: limit)) { [weak self] (response: ManufactuerApi, error: Error?)  in
      guard let manufacturer = self?.mapper.manufacturer(from: response) else {
        return
      }
      completion(.success(manufacturer))
    }
  }

  func fetchNextPageManufacturers() {
    print("ABCD")
  }
}
