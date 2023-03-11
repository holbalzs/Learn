//
//  LoginService.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 04..
//

import Foundation
import Combine

protocol LoginServiceProtocol: AnyObject {
    func getUserState() -> AnyPublisher<String, Error>
}

class LoginService: LoginServiceProtocol {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getUserState() -> AnyPublisher<String, Error> {
        return Just("Test")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
