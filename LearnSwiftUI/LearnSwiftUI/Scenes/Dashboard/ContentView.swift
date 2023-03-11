//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 02. 26..
//

import SwiftUI

struct ContentView: View {
    @StateObject var sidebarViewModel = SiderbarMenuViewModel()
    @ObservedObject var viewModel: DashboardViewModel
    @State var leftSideIsOpen = true
    @State var rightSideIsOpen = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: 0) {
                HStack {
                    Text(sidebarViewModel.selectedMenuItem?.name ?? "")
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                
                VStack {
                    switch sidebarViewModel.selectedMenuItem?.menuType {
                    case .home:
                        HomeView()
                    case .calendar:
                        CalendarView()
                    case .library:
                        LibraryView()
                    case .settings:
                        SettingsView()
                    case .profile:
                        ProfileView()
                    default:
                        Text("default view")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.green)
                
            }
            .padding(.leading, 50) // leftside closed with
            .padding(.trailing, 50) // rightside closed with
            
            HStack {
                // Left sidebar
                LeftSideView(
                    leftSideIsOpen: $leftSideIsOpen,
                    sidebarViewModel: sidebarViewModel
                )
                .ignoresSafeArea()
                
                Spacer()
                
                // Right sidebar
                RightSide(
                    rightSideIsOpen: $rightSideIsOpen
                )
                .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: DashboardViewModel(networkManager: NetworkManager()))
    }
}
