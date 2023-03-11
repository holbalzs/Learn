//
//  NextViewController.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import UIKit

class NextViewController: UIViewController {
    var navigate: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
    }
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Navigate next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(navigateToNext(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func navigateToNext(_ sender: UIButton) {
        navigate?()
    }
}
