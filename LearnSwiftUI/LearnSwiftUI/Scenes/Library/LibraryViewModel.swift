//
//  LibraryViewModel.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 11..
//

import Foundation
import SwiftUI

final class LibraryViewModel: ObservableObject {
    @Published var menuItems: [LibrarySideMenuItem] = []
    @Published var selectedMenuItem: LibrarySideMenuItem?
    
    init() {
        loadMenuElements()
    }

    private func loadMenuElements() {
        self.menuItems = [
            LibrarySideMenuItem(icon: "tray.full", name: LibrarySideMenuElement.details.rawValue, menuType: .details),
            LibrarySideMenuItem(icon: "tray.full", name: LibrarySideMenuElement.profile.rawValue, menuType: .profile)
            
        ]
    }
}

enum LibrarySideMenuElement: String {
    case details = "Details"
    case profile = "Profile"
}

struct LibrarySideMenuItem: Identifiable, Hashable {
    let id = UUID()
    var icon: String
    var name: String
    var menuType: LibrarySideMenuElement
}
