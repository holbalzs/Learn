//
//  ControllerFactory.swift
//  LearnUIKit
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import Foundation
import UIKit

class ControllerFactory {
    private init() {}
    
    static func generateController(_ book: Book, title: String, color: UIColor = .white, changeHandler: ((Book) -> Void)?) -> ViewController {
        let vc = ViewController(book: book)
        vc.view.backgroundColor = color
        vc.changeBook = changeHandler
        vc.tabBarItem.title = title
        return vc
    }
}
