//
//  DataModelElement.swift
//  ByteCoin
//
//  Created by Onur Sir on 19.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
// MARK: - DataModelElement
struct DataModelElement : Codable {
    let assetID, name: String?
    let typeIsCrypto: Int?
    let dataQuoteStart, dataQuoteEnd, dataOrderbookStart, dataOrderbookEnd: String?
    let dataTradeStart, dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd, volume1DayUsd, volume1MthUsd: Double?
    let idIcon, dataStart, dataEnd: String?
    let priceUsd: Double?
}
