//
//  HomeViewModel.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 11..
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var authorElement: [Author] = []
    
    let writingService: Writing
    let bookPublisherService: ServiceType
    let purchaseService: ServiceType2
    let subscriberService: ServiceType3
    
    init(writingService: Writing, bookPublisherService: ServiceType, purchaseService: ServiceType2, subscriberService: ServiceType3) {        
        self.writingService = writingService
        self.bookPublisherService = bookPublisherService
        self.purchaseService = purchaseService
        self.subscriberService = subscriberService
        
        authorElement = [
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark"),
            Author(name: "Sam"),
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark"),
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark"),
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark"),
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark"),
            Author(name: "Dave"),
            Author(name: "John"),
            Author(name: "Mark")
        ]
    }
}

struct Author {
    let id = UUID()
    let name: String
}
