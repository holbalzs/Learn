//
//  CalendarView.swift
//  LearnSwiftUI
//
//  Created by Holló Balázs on 2023. 03. 10..
//

import SwiftUI

struct CalendarView: View {
    @State var keyboardText: String = ""
    
    var body: some View {
        Text("Calendar")
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
