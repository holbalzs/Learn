//
//  ViewController.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import UIKit

class ViewController: UIViewController, BookStorageManage {
    
    // MARK: - BookStorageManage
    // TODO: - Better way to identify the subscriber for able to remove if deinit
    var identifier: String {
        return ObjectIdentifier(self).debugDescription
    }
    
    func refreshBook(book: Book) {
        self.book = book
    }
    
    deinit {
        
    }
    
    var book: Book {
        didSet {
            loadText()
        }
    }
    var changeBook: ((Book) -> Void)?
    
    init(book: Book) {
        self.book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
        loadText()
    }
    
    private func loadText() {
        titleLabel.text = "\(book.id) \(book.name ?? "") \(book.rating?.description ?? "")"
    }
    
    private func setup() {
        view.addSubview(titleLabel)
        view.addSubview(refreshButton)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            
            refreshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            refreshButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50)
        ])
    }
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change Book", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(changeBookProperty(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func changeBookProperty(_ sender: UIButton) {
        book.name = "Some changed title"
        changeBook?(book)
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
