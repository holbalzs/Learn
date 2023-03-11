//
//  LeftSideView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct LeftSideView: View {
    @Binding var leftSideIsOpen: Bool
    @ObservedObject var sidebarViewModel: SiderbarMenuViewModel
    @ObservedObject var leftSidebarViewModel = LeftSideBarViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Button {
                    leftSideIsOpen.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                .padding()
                
                Divider()
                
                ForEach(sidebarViewModel.menuItems, id: \.id) { menu in
                    Button {
                        sidebarViewModel.selectMenu(selectingMenu: menu)
                        leftSideIsOpen = false
                    } label: {
                        HStack {
                            Image(menu.icon)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(sidebarViewModel.selectedMenuItem == menu ? Color.white : menu.color)
                                .frame(width: 15, height: 15)
                                .padding(.leading, 10)
                            if leftSideIsOpen {
                                Text(menu.name)
                                    .foregroundColor(sidebarViewModel.selectedMenuItem == menu ? Color.white : menu.color)
                                    .font(.subheadline)
                                    .padding(.leading, 10)
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(width: leftSideIsOpen ? 120 : 50)
        .frame(maxHeight: .infinity)
        .background(
            Color.gray
        )
    }
}
