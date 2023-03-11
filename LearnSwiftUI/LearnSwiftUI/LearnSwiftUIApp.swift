//
//  LearnSwiftUIApp.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import SwiftUI

@main
struct LearnSwiftUIApp: App {
    @StateObject var loginState = AppLoginState()
    
    var body: some Scene {
        WindowGroup {
            switch loginState.state {
            case .none, .expired:
                LoginView(
                    viewModel: LoginViewModel(networkManager: NetworkManager())
                )
                .environmentObject(loginState)
            case .validRefresh, .validAccess:
                LoaderStartView(networkManager: NetworkManager(), state: loginState.state)
                    .environmentObject(loginState)
            case .loggedIn:
                ContentView(
                    viewModel: DashboardViewModel(networkManager: NetworkManager()))
                    .statusBar(hidden: true)
                    .environmentObject(loginState)
            }
        }
    }
}

enum TokenState: String {
    case none, validAccess, validRefresh, expired
    case loggedIn
}

final class AppLoginState: ObservableObject {
    @Published var state: TokenState = .none
    private let auth = Authenticator()

    init() {
        self.state = auth.getTokenState()
    }
}

class Authenticator: ObservableObject {
    func getTokenState() -> TokenState {
        // check if token stored and valid or no token or not valid
        // return .loggedIn // for skip login flow
        return .none
    }
}
