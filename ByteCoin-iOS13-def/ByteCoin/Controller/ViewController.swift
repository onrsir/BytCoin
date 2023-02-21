//
//  CoinAsset.swift
//  ByteCoin
//
//  Created by Onur Sir on 19.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
        
        // MARK: - Outlet
        
    @IBOutlet weak var currencyLabel: UILabel!
        
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var bitcoinImage: UIImageView!
    
    @IBOutlet weak var newImage: UIImageView!
    
    @IBOutlet weak var bitcoinLabel: UILabel!
        
    @IBOutlet weak var currencyPicker: UIPickerView!

    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager = CoinManager()
    var apiManager = APIManager()
    var pickerData: [String] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            currencyPicker.dataSource=self
            currencyPicker.delegate=self
            pickerView.delegate=self
            pickerView.dataSource=self
            coinManager.delegate=self
            coinManager.delegates = self
         
                apiManager.getAssets { names, error in
                guard let names = names else { return }
                self.pickerData = names
                DispatchQueue.main.async {
                                   self.pickerView.reloadAllComponents()
                    }
                }
            }
        }

// MARK: - EXTENSİON : PICKERVİEW
extension ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == currencyPicker {
            return coinManager.currencyArray.count
        } else {
            return pickerData.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == currencyPicker {
            return coinManager.currencyArray[row]
        } else {
            return pickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == currencyPicker {
            let selectedCurrency = coinManager.currencyArray[row]
            coinManager.getCoinPrice(for: selectedCurrency)
        } else {
            let selectedSymbol = pickerData[row]
            
            coinManager.getPrice(for: selectedSymbol)
            
            apiManager.getAssetsIcons(for: [selectedSymbol], size: 64) { icons in
                print(icons)
                guard let icon = icons[selectedSymbol] else {
                    return
                }
                self.newImage.image = icon
            }
        }
    }
}
// MARK: - DELEGATE
extension ViewController : CoinManagerDelegate , NewCoinDelegate{
    func didPrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.btcLabel.text = price
        }
       
    }
    
    
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
            
            
        }
    }
}
extension ViewController : APIManagerDelegate {
    func didLoadAllAssets() {
            DispatchQueue.main.async {
                self.pickerData = APIManager.shared.coinNames
                self.pickerView.reloadAllComponents()
            }
        }
}
