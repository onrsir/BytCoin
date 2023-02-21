//
//  APIKeyManager.swift
//  ByteCoin
//
//  Created by Onur Sir on 22.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//
import UIKit
import Foundation
struct APIKeyManager {
    var apiKeys: [String]
    var currentIndex = 0
    
    mutating func getNextKey() -> String {
        let key = apiKeys[currentIndex]
        currentIndex = (currentIndex + 1) % apiKeys.count
        return key
    }
}
