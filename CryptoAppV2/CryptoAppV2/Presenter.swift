//
//  Presenter.swift
//  CryptoAppV2
//
//  Created by Ozan Çiçek on 30.01.2023.
//

import Foundation

// Class, protocol
// talks to -> interactor, router, view

enum NetworkError: Error {
    case NetworkFaild
    case ParsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInterector? { get set }
    var view: AnyView? { get set }

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?

    var interactor: AnyInterector?

    var view: AnyView?

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case let .success(cryptos):
            print("update")

        case let .failure(error):
            print("errr")
        }
    }
}
