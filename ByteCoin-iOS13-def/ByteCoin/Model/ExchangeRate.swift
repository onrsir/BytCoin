//
//  ExchangeRate.swift
//  ByteCoin
//
//  Created by Onur Sir on 21.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct ExchangeRate: Codable {
    let assetIDQuote: String
    let rate: Double
    let rateUSD: Double

    enum CodingKeys: String, CodingKey {
        case assetIDQuote = "asset_id_quote"
        case rate
        case rateUSD = "rate_usd"
    }
}
