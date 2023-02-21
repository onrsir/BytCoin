//
//  NewDataxElement.swift
//  ByteCoin
//
//  Created by Onur Sir on 19.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newDatax = try? JSONDecoder().decode(NewDatax.self, from: jsonData)

import Foundation

// MARK: - NewDataxElement
struct NewDataxElement:Decodable {
    let assetID, name: String?
    let typeIsCrypto: Int?
    let dataQuoteStart, dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd: String?
    let dataTradeStart, dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?
    let idIcon, dataStart, dataEnd: String?
    let priceUsd: Double?
}

