//
//  CalendarView.swift
//  DermaVision
//
//  Created by Riya Jain on 2/4/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()

    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
                .datePickerStyle(.graphical)
                .accentColor(Color("Color2"))
                .background(LinearGradient(gradient: Gradient(colors: [Color("Color4"), Color("Color3")]), startPoint: .top, endPoint: .bottom))
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print("hi")
            }
        }
        .colorScheme(.light)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
