//
//  CarTypesTests.swift
//  CarTypesTests
//
//  Created by Deepak Arora on 31.03.20.
//  Copyright © 2020 Deepak Arora. All rights reserved.
//

import XCTest
@testable import CarTypes

class CarTypesTests: XCTestCase {}

enum MockResponseFile: String {
  case validResponse = "response"
  case invalidResponse = "invalid_response"
}

struct ParsingError: Error {
  let message: String

  init(_ message: String) {
    self.message = message
  }

  public var localizedDescription: String {
    return message
  }
}

func mockResponse<R: Codable>(fromJSONFile file: MockResponseFile) throws -> R {
  let bundle = Bundle(for: CarTypesTests.self)
  guard let url = bundle.url(forResource: file.rawValue, withExtension: "json") else {
    throw ParsingError("file \(file.rawValue).json not found")
  }
  do {
    let jsonData = try Data(contentsOf: url)
    let decoder = JSONDecoder()
    let response = try decoder.decode(R.self, from: jsonData)
    return response
  } catch let DecodingError.keyNotFound(key, context) {
    throw ParsingError(
      "Failed to decode \(file) due to missing key '\(key.stringValue)' not found – \(context.debugDescription)"
    )
  } catch let DecodingError.typeMismatch(_, context) {
    throw ParsingError("Failed to decode \(file) due to type mismatch – \(context.debugDescription)")
  } catch let DecodingError.valueNotFound(type, context) {
    throw ParsingError("Failed to decode \(file) due to missing \(type) value – \(context.debugDescription)")
  } catch DecodingError.dataCorrupted(_) {
    throw ParsingError("Failed to decode \(file) because it appears to be invalid JSON")
  } catch {
    throw ParsingError("Failed to decode \(file) error : \(error.localizedDescription)")
  }
}
