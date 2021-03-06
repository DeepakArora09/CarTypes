//
//  NetworkService.swift
//  CarTypes
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import Foundation

protocol NetworkServicing {
  func request<T: Codable>(router: NetworkRouter, completion: @escaping (_: T, _: Error?) -> Void)
}

final class NetworkService: NetworkServicing {
  private var components = URLComponents()
  func request<T: Codable>(router: NetworkRouter, completion: @escaping (_: T, _: Error?) -> Void) {
    components.scheme = router.scheme
    components.host = router.host
    components.path = router.path
    components.queryItems = router.parameters

    let session = URLSession(configuration: .default)
    guard let url = components.url else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = router.method

    let dataTask = session.dataTask(with: urlRequest) { data, response, error in
      guard error == nil, response != nil, let data = data else {
        return // Error scenario not handled!
      }
      guard let responseObject = try? JSONDecoder().decode(T.self, from: data) else {
        fatalError("Incorrect JSON from API response")
      }
      completion(responseObject, nil)
    }
    dataTask.resume()
  }
}
