//
//  NetworkManager.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 04..
//

import Foundation

class NetworkManager: ObservableObject {
//    private let session: NetworkSession
//    var authenticator: Authenticator
    
    func getMainUserData(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
}
