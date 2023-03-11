//
//  RightSide.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct RightSide: View {
    @Binding var rightSideIsOpen: Bool
    private let openedWidth: CGFloat = 232
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                withAnimation {
                    rightSideIsOpen.toggle()
                }
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
            }
            .padding()
            Spacer()

        }
        .frame(width: rightSideIsOpen ? openedWidth : 50)
        .frame(maxHeight: .infinity)
        .background(Color.gray)
    }
}
