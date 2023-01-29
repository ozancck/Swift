//
//  WebService.swift
//  CryptoApp
//
//  Created by Ozan Çiçek on 29.01.2023.
//

import Foundation

class WebService {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)

                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
