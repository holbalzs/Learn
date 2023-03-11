//
//  HomeView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel(writingService: WritingService(), bookPublisherService: BookPublisherService(), purchaseService: PurchaseService(), subscriberService: SubscriberService())
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem()], spacing: 10) {
                    ForEach(viewModel.authorElement, id: \.id) { item in
                        NavigationLink(destination: navigateAuthorDetail(id: item.id, name: item.name)) {
                            AuthorCardView(author: item)
                                .frame(width: 150, height: 80)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder func navigateAuthorDetail(id: UUID, name: String) -> some View {
        AuthorDetailView(viewModel: AuthorDetailViewModel(name: name))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
                      
struct AuthorDetailView: View {
    @StateObject var viewModel: AuthorDetailViewModel
    
    var body: some View {
        Text(viewModel.greetings)
    }
}

class AuthorDetailViewModel: ObservableObject {
    @Published var greetings: String = ""
    
    init(name: String) {
        greetings = "Welcome dear \(name)"
    }
}
