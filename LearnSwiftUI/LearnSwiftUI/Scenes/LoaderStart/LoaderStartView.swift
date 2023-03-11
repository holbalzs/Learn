//
//  LoaderStartView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 05..
//

import SwiftUI

struct LoaderStartView: View {
    @StateObject var viewModel: LoaderViewModel
    @EnvironmentObject var loginState: AppLoginState
    
    init(networkManager: NetworkManager, state: TokenState) {
        self._viewModel = StateObject(wrappedValue: LoaderViewModel(networkManager: networkManager, state: state))
    }
    
    var body: some View {
        ZStack {
            Color.white
            Text("Loading...")
        }
        .onAppear {
            viewModel.userDataLoad()
        }
        .onChange(of: viewModel.state, perform: { newStateValue in
            withAnimation {
                if newStateValue == .none {
                    loginState.state = .none
                } else {
                    loginState.state = newStateValue
                }
            }
        })
    }
}

struct LoaderStartView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderStartView(networkManager: NetworkManager(), state: .validAccess)
    }
}

final class LoaderViewModel: ObservableObject {
    let networkManager: NetworkManager
    @Published var state: TokenState
    
    init(networkManager: NetworkManager, state: TokenState) {
        self.networkManager = networkManager
        self.state = state
    }
    
    func userDataLoad() {
        networkManager.getMainUserData { [weak self] in
            self?.state = .loggedIn
        }
    }
}
