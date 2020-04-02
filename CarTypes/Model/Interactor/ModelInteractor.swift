//
//  ModelInteractor.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ModelInteracting {
  func fetchModels(
    for page: Int,
    id: String,
    completion: @escaping (Result<ResponseDomain, Error>) -> Void
  )
}

final class ModelInteractor: ModelInteracting {
  private let mapper: Mapping
  private let service: NetworkServicing
  private let limit = 15

  init(service: NetworkServicing, mapper: Mapping) {
    self.service = service
    self.mapper = mapper
  }

  func fetchModels(
    for page: Int,
    id: String,
    completion: @escaping (Result<ResponseDomain, Error>) -> Void
  ) {
    service.request(
      router: .getMainTypes(manufacturerId: id, page: page, size: limit)
    ) { [weak self] (response: ResponseApi, error: Error?)  in
      guard let model = self?.mapper.domain(from: response) else {
        return
      }
      completion(.success(model))
    }
  }
}
