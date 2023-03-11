//
//  Book.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import Foundation

class Book {
    let id: Int
    var name: String?
    var rating: Double?
    
    init(id: Int, name: String? = nil, rating: Double? = nil) {
        self.id = id
        self.name = name
        self.rating = rating
    }
}
