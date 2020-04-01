//
//  ManufacturerInteractor.swift
//  CarTypes
//
//  Created by Deepak Arora on 01.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol ManufacturerInteracting {
  func fetchInitialManufacturers()
  func fetchNextPageManufacturers()
}

final class ManufacturerInteractor: ManufacturerInteracting {
  private let service: NetworkServicing
  private var offset = 0
  private let limit = 15

  init(service: NetworkServicing) {
    self.service = service
  }

  func fetchInitialManufacturers() {
    print("DEFG")
  }

  func fetchNextPageManufacturers() {
    print("ABCD")
  }
}
