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
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?

    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCrypto()
        }
    }

    var view: AnyView?

    /*
     init(){
         interactor?.downloadCrypto()
     }
      */

    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case let .success(cryptos):
            view?.update(with: cryptos)
        case .failure:
            view?.update(with: "Try again later")
        }
    }
}
