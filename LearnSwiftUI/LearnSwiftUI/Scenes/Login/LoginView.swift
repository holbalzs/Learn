//
//  LoginView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 04..
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginState: AppLoginState
    @ObservedObject var viewModel: LoginViewModel
    @State private var showSafari: Bool = false
    
    var body: some View {
        VStack {
            Text("Login screen")
            Button(action: {
                showSafari.toggle()
            }) {
                Text("Alternative login for developers")
            }
        }
        .fullScreenCover(
            isPresented: $showSafari,
            onDismiss: {
                // Just for the demonstration, because no real server connection in this project
                viewModel.exchangeCodeForToken(URL(string: "not_working")!)
            }, content: {
                SFSafariViewWrapper(url: viewModel.startLoginFlow())
                    .statusBarHidden(true)
            })
        .onOpenURL { url in
            // when loged in safari opened a specific url, the app continues here
            viewModel.exchangeCodeForToken(url)
        }
        .onChange(of: viewModel.isSuccessLogin, perform: { newStateValue in
            withAnimation {
                if newStateValue {
                    loginState.state = .validAccess
                }
            }
        })

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(networkManager: NetworkManager()))
    }
}

