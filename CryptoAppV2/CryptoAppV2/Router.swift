//
//  Router.swift
//  CryptoAppV2
//
//  Created by Ozan Çiçek on 30.01.2023.
//

import Foundation

// Class, protocol
// EntryPoint

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}
