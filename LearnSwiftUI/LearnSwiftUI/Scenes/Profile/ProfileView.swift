//
//  ProfileView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        HStack {
            VStack {
                ForEach(viewModel.menuItems, id: \.id) { menu in
                    Button(action: {
                        viewModel.selectedMenuItem = menu
                    }, label: {
                        HStack(spacing: 12) {
                            Text(menu.name)
                                .font(.subheadline)
                                .foregroundColor(
                                    viewModel.selectedMenuItem == menu ? .brown : .black
                                )
                                .padding(.leading, 22)
                            
                            Spacer()
                            
                            Image(systemName: menu.icon)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.black)
                                .frame(width: 13, height: 13, alignment: .center)
                                .padding(.trailing, 22)
                        }
                        .frame(height: 59)
                        .background(viewModel.selectedMenuItem == menu ? Color.yellow : Color.clear)
                    })
                }
                Spacer()
            }
            .frame(width: 180)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
            
            VStack {
                switch viewModel.selectedMenuItem?.menuType {
                case .details:
                    ProfileInnerDetailView()
                case .profile:
                    ProfileInnerProfileView()
                case .security:
                    ProfileInnerSecurityView()
                case .billing:
                    ProfileInnerBillingView()
                case .emails:
                    ProfileInnerEmailsView()
                case .notifications:
                    ProfileInnerNotificationsView()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
        }
        .padding(8)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// MARK: - Inner Elements

struct ProfileInnerDetailView: View {
    var body: some View {
        VStack {
            Text("ProfileInnerDetailView")
            Button {
                //
            } label: {
                Text("Navigate to Library side menu's inner view")
            }
            Button {
                //
            } label: {
                Text("Navigate to calendar")
            }
        }
    }
}

struct ProfileInnerProfileView: View {
    var body: some View {
        Text("ProfileInnerProfileView")
    }
}

struct ProfileInnerSecurityView: View {
    var body: some View {
        Text("ProfileInnerSecurityView")
    }
}

struct ProfileInnerBillingView: View {
    var body: some View {
        Text("ProfileInnerBillingView")
    }
}

struct ProfileInnerEmailsView: View {
    var body: some View {
        Text("ProfileInnerEmailsView")
    }
}

struct ProfileInnerNotificationsView: View {
    var body: some View {
        Text("ProfileInnerNotificationsView")
    }
}
