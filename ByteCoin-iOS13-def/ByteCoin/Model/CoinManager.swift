//
//  CoinAsset.swift
//  ByteCoin
//
//  Created by Onur Sir on 19.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let baseUSD = "https://rest.coinapi.io/v1/exchangerate/USD"
    let apiKey = "D2D5E5D9-AFEC-40A0-9B2B-439A70BDBAE5"
    let apiKey2 = "BC4AAE5E-D264-4B01-9FD7-DF5B931D4E75"
    let apiKeys = "1C6399C8-31E8-4DBB-8B89-298DD65A2DE3"
    let apiKeysx = "914D07A4-57D8-4FA4-A9B0-8E11C9BD9DE5"
    var apiKeyIndex = 0
    var delegate: CoinManagerDelegate?
    var delegates: NewCoinDelegate?
    var pickerData: [String] = []
    var arrayim : [String] = []
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD",
                         "ILS","INR","JPY","MXN","NOK","NZD","PLN",
                         "RON","RUB","SEK","SGD","USD","ZAR","IDR"]
                         

    // MARK: - I PULL THE DATA 
    func getCoinPrice(for currency : String){
        
        let UrlString = "\(baseURL)/\(currency)?apikey=\(apiKeysx)"
       

        guard let requestURL : URL = URL(string: UrlString) else {  return   }
          
     
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard data != nil, error == nil else {return}
            
            let dataSend = parseJSON(data!)
            
            if let priceSend = dataSend {
            let safePrice = String(format: "%.2f", priceSend)
            self.delegate?.didUpdatePrice(price: safePrice, currency: currency)
            }
        } .resume()
        
        }
  
    
    func getPrice(for currency : String){
        
        let UrlString = "\(baseUSD)/\(currency)?apikey=\(apiKeysx)"
        
        guard let requestURL : URL = URL(string: UrlString) else {  return   }
          
     
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard data != nil, error == nil else {return}
            
            let dataSend = parseJSON(data!)
            
            if let priceSend = dataSend {
            let safePrice = String(format: "%.2f", priceSend)
            self.delegates?.didPrice(price: safePrice, currency: currency)
            }
        } .resume()
        
    }
      func getPrices(for currencies: [String]) {
        for currency in currencies {
            getCoinPrice(for: currency)
        }
}

     func parseJSON(_ data: Data) -> Double? {
        do {
            let decodedData = try JSONDecoder().decode(CoinData.self, from: data)
            let lastRatef = decodedData.rate
            
                //print(lastRatef)
        
            return lastRatef
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
}

// MARK: - PROTOCOL
protocol CoinManagerDelegate {
    func didUpdatePrice(price:String,currency:String)
    
}
protocol NewCoinDelegate {
    func didPrice(price:String,currency:String)
}
