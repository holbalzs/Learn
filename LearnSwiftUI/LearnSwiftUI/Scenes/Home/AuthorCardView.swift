//
//  AuthorCardView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 11..
//

import SwiftUI

struct AuthorCardView: View {
    @State var author: Author
    
    var body: some View {
        HStack {
            Text(author.name)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.mint)
        )
    }
}

struct AuthorCardView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorCardView(author: Author(name: "Test"))
    }
}
