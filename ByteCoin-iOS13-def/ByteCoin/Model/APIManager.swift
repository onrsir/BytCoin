////
////  APIManager.swift
////  ByteCoin
////
////  Created by Onur Sir on 20.02.2023.
////  Copyright © 2023 The App Brewery. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//struct APIManager {
//    static let shared = APIManager()
//    let baseURL = "https://rest.coinapi.io/v1/assets"
//    let apiKey = "D2D5E5D9-AFEC-40A0-9B2B-439A70BDBAE5"
//    let apiKey2 = "BC4AAE5E-D264-4B01-9FD7-DF5B931D4E75"
//    var coinNames: [String] = []
//    var delegate: APIManagerDelegate?
//
//
//    func getAssets(completion: @escaping ([String]?, Error?) -> Void) {
//        let urlString = "\(baseURL)?apikey=\(apiKey2)"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//            guard let data = data else {
//                completion(nil, nil)
//                return
//            }
//            do {
//                let assets = try JSONDecoder().decode([CoinAsset].self, from: data)
//                let cryptoAssets = assets.filter { $0.typeIsCrypto == 1 }
//                let coinIDs = cryptoAssets.compactMap { $0.assetID }
//                completion(coinIDs, nil)
//                DispatchQueue.main.async {
//                    self.delegate?.didLoadAllAssets() }
//            } catch {
//                completion(nil, error)
//            }
//        }.resume()
//    }
//
//
//}
//
//
//
//    protocol APIManagerDelegate {
//
//        func didLoadAllAssets()
//    }
//
//  APIManager.swift
//  ByteCoin
//
//  Created by Onur Sir on 20.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
import UIKit
 
struct APIManager {
    static let shared = APIManager()
    let baseURL = "https://rest.coinapi.io/v1/assets"
    let apiKey = "D2D5E5D9-AFEC-40A0-9B2B-439A70BDBAE5"
    let apiKey2 = "BC4AAE5E-D264-4B01-9FD7-DF5B931D4E75"
    let apiKeys = "1C6399C8-31E8-4DBB-8B89-298DD65A2DE3"
    let apiKeysx = "914D07A4-57D8-4FA4-A9B0-8E11C9BD9DE5"
    var coinNames: [String] = []
    var delegate: APIManagerDelegate?

    
    //MARK: - The function where I pull all the data
    func getAssets(completion: @escaping ([String]?, Error?) -> Void) {
        let urlString = "\(baseURL)?apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            do {
                let assets = try JSONDecoder().decode([CoinAsset].self, from: data)
                let cryptoAssets = assets.filter { $0.typeIsCrypto == 1 }
                let coinIDs = cryptoAssets.compactMap { $0.assetID }
                completion(coinIDs, nil)
                DispatchQueue.main.async {
                    self.delegate?.didLoadAllAssets() }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    
    // MARK: - PULL ICON
        func getAssetsIcons(for symbols: [String], size: Int, completion: @escaping ([String: UIImage]) -> Void) {
            var symbolsIcons: [String: UIImage] = [:]
            let group = DispatchGroup()
            let baseIconUrl = "https://cryptoicons.org/api/icon/"
    
            for symbol in symbols {
                group.enter()
    
                let url = baseIconUrl + symbol.lowercased() + "/" + "\(size)"
                let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
                    defer { group.leave() }
    
                    guard error == nil,
                          let data = data,
                          let image = UIImage(data: data) else {
                        let images = UIImage(systemName: "bitcoinsign.circle.fill")
                        symbolsIcons[symbol] = images
                       // print("Error retrieving icon for symbol: \(symbol)")
                        return
                    }
    
                    symbolsIcons[symbol] = image
                }
                task.resume()
            }
    
            group.notify(queue: .main) {
                completion(symbolsIcons)
            }
        }
    
        }

    protocol APIManagerDelegate {
        
        func didLoadAllAssets()
    }
