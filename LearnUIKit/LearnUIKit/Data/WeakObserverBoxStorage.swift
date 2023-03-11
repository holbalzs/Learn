//
//  WeakObserverBoxStorage.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import Foundation

class WeakObserverBoxStorage {
    weak var unbox: BookStorageManage?

    init(_ observer: BookStorageManage) {
        self.unbox = observer
    }
}

protocol BookStorageManage: AnyObject {
    var identifier: String { get }
    func refreshBook(book: Book)
}
