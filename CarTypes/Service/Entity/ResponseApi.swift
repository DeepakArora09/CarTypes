//
//  ResponseApi.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

struct ResponseApi: Codable {
  let currentPage: Int
  let totalPages: Int
  let items: [String: String]

  enum CodingKeys: String, CodingKey {
    case currentPage = "page"
    case totalPages = "totalPageCount"
    case items = "wkda"
  }
}
