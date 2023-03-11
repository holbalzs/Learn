//
//  LibraryView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct LibraryView: View {
    @StateObject var viewModel = LibraryViewModel()
    
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
                    LibraryInnerDetailView()
                case .profile:
                    LibraryInnerProfileView()
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

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

struct LibraryInnerProfileView: View {
    var body: some View {
        Text("LibraryInnerProfileView")
    }
}

struct LibraryInnerDetailView: View {
    var body: some View {
        Text("LibraryInnerDetailView")
    }
}
