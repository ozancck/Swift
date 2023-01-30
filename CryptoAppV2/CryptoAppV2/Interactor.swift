//
//  Interactor.swift
//  CryptoAppV2
//
//  Created by Ozan Çiçek on 30.01.2023.
//

import Foundation

// Class, protocol
// talks to-> presenter

protocol AnyInterector {
    var presenter: AnyPresenter? { get set }

    func downloadCryptos()
}

class CryptoInteractor: AnyInterector {
    var presenter: AnyPresenter?

    func downloadCryptos() {
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil
            else {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.NetworkFaild))
                return
            }

            do {
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                self.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))

            } catch {
                self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.ParsingFailed))
            }
        }

        task.resume()
    }
}
