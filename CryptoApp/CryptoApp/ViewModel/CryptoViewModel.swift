//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Ozan Çiçek on 29.01.2023.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return cryptoCurrencyList.count
    }

    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = cryptoCurrencyList[index]

        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
}

extension CryptoViewModel {
    var name: String {
        return cryptoCurrency.currency
    }

    var price: String {
        return cryptoCurrency.price
    }
}
