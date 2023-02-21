//
//  CoinAsset.swift
//  ByteCoin
//
//  Created by Onur Sir on 19.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct CoinAsset: Codable {
    let assetID: String?
    let name: String?
    let typeIsCrypto: Int?
    let dataStart: String?
    let dataEnd: String?
    let dataQuoteStart: String?
    let dataQuoteEnd: String?
    let dataOrderbookStart: String?
    let dataOrderbookEnd: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1Hrs: Double?
    let volume1HrsUsd: Double?
    let volume1Day: Double?
    let volume1DayUsd: Double?
    let volume1Mth: Double?
    let volume1MthUsd: Double?
    var priceUsd: Double?
    let idIcon: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1Hrs = "volume_1hrs"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1Day = "volume_1day"
        case volume1DayUsd = "volume_1day_usd"
        case volume1Mth = "volume_1mth"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }
}
