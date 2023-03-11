//
//  ProfileViewModel.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import Foundation
import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var menuItems: [ProfileSideMenuItem] = []
    @Published var selectedMenuItem: ProfileSideMenuItem?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadMenuElements()
    }

    private func loadMenuElements() {
        self.menuItems = [
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.details.rawValue, menuType: .details),
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.profile.rawValue, menuType: .profile),
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.security.rawValue, menuType: .security),
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.billing.rawValue, menuType: .billing),
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.emails.rawValue, menuType: .emails),
            ProfileSideMenuItem(icon: "tray.full", name: ProfileSideMenuElement.notifications.rawValue, menuType: .notifications)
            
        ]
    }
}

enum ProfileSideMenuElement: String {
    case details = "Details"
    case profile = "Profile"
    case security = "Security"
    case billing = "Billing"
    case emails = "Emails"
    case notifications = "Notifications"
}

struct ProfileSideMenuItem: Identifiable, Hashable {
    let id = UUID()
    var icon: String
    var name: String
    var menuType: ProfileSideMenuElement
}
