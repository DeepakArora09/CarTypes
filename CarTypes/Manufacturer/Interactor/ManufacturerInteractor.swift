//
//  ManufacturerInteractor.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerInteracting {
  func fetchManufacturers(
    for page: Int,
    completion: @escaping (Result<ResponseDomain, Error>) -> Void
  )
}

final class ManufacturerInteractor: ManufacturerInteracting {
  private let mapper: Mapping
  private let service: NetworkServicing
  private let limit = 15

  init(service: NetworkServicing, mapper: Mapping) {
    self.service = service
    self.mapper = mapper
  }

  func fetchManufacturers(
    for page: Int,
    completion: @escaping (Result<ResponseDomain, Error>) -> Void
  ) {
    service.request(
      router: .getManufacturers(page: page, size: limit)
    ) { [weak self] (response: ResponseApi, _: Error?)  in
      guard let manufacturer = self?.mapper.domain(from: response) else {
        return
      }
      completion(.success(manufacturer))
    }
  }
}
