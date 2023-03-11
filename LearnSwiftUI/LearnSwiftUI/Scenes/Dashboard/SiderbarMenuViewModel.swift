//
//  SiderbarMenuViewModel.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

class SiderbarMenuViewModel: ObservableObject {
    @Published var menuItems: [SideMenuItem] = []
    @Published var subMenuItems: [SideMenuItem] = []
    @Published var selectedMenuItem: SideMenuItem?
    @Published var changedUserData: Bool = false

    init() {
        self.menuItems = [
            SideMenuItem(icon: "side_home_old", name: SideMenuElement.home.rawValue, menuType: .home, color: .red),
            SideMenuItem(icon: "side_calendar_old", name: SideMenuElement.calendar.rawValue, menuType: .calendar, color: .yellow),
            SideMenuItem(icon: "side_settings_old", name: SideMenuElement.library.rawValue, menuType: .library, color: .indigo),
            SideMenuItem(icon: "side_settings_old", name: SideMenuElement.settings.rawValue, menuType: .settings, color: .blue),
            SideMenuItem(icon: "side_home_old", name: SideMenuElement.profile.rawValue, menuType: .profile, color: .green)
        ]

        self.selectedMenuItem = menuItems.first
    }
    
    func selectMenu(selectingMenu: SideMenuItem) {
        selectedMenuItem = selectingMenu
    }
}

enum SideMenuElement: String {
    case home = "Home"
    case calendar = "Calendar"
    case library = "Library"
    case settings = "Settings"
    case profile = "Profile"
}

struct SideMenuItem: Identifiable, Hashable {
    let id = UUID()
    var icon: String
    var name: String
    var menuType: SideMenuElement
    var color: Color
}
