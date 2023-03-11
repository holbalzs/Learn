//
//  BookStorage.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import Foundation

final class BookStorage {
    var books = Dictionary<Int, Book>()
    
    // TODO: - Want to store delegates so I can notify if something is changed. weak var delegate: Protocol? not work because there are more than one subscriber
    var observers: [WeakObserverBoxStorage] = []
    
    init() {
        let testData = BookStorage.loadTestData()
        for element in testData {
            books[element.id] = element
        }
    }
    
    func changeBook(_ book: Book) {
        books[book.id] = book
        notifyAboutChanges(book)
    }
    
    // TODO: - Maybe not the Bookstorage has to use logic to add/remove observer
    func addObserver(_ observing: WeakObserverBoxStorage) {
        observers.append(observing)
    }

    func removeObserver(_ observing: WeakObserverBoxStorage) {
        observers = observers.filter({ $0.unbox?.identifier != observing.unbox?.identifier })
    }

    private func notifyAboutChanges(_ book: Book) {
        observers.forEach {
            $0.unbox?.refreshBook(book: book)
        }
    }
    // ---------
    
    static func loadTestData() -> [Book] {
        var books = [Book]()
        books.append(Book(id: 0, name: "Test Book 0", rating: 4.2))
        books.append(Book(id: 1, name: "Test Book 1", rating: 3.2))
        books.append(Book(id: 2, name: "Test Book 2", rating: 3.6))
        books.append(Book(id: 3, name: "Test Book 3", rating: 1.3))
        books.append(Book(id: 4, name: "Test Book 4", rating: 4.4))
        return books
    }
}
