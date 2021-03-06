//
//  ResponseDomain.swift
//  CarTypes
//
//  Created by Deepak Arora on 02.04.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

struct ResponseDomain {
  var currentPage: Int
  let totalPages: Int
  var items: [DomainItem]
}
