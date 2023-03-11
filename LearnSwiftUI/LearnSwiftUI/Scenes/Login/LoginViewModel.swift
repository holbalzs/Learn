//
//  LoginViewModel.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 04..
//

import Foundation

final class LoginViewModel: ObservableObject {
    let networkManager: NetworkManager
    @Published var isSuccessLogin = false
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func startLoginFlow() -> URL {
        // URL for login via webbrowser, because using keycloak also
        return URL(string: "https://www.google.com")!
    }
    
    func exchangeCodeForToken(_ url: URL) {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let sessionState = urlComponents?.queryItems?.first(where: { $0.name == "session_state" })?.value
        let code = urlComponents?.queryItems?.first(where: { $0.name == "code" })?.value
        // ...
        // If login was succes and get token
        
        isSuccessLogin = true
    }
}


