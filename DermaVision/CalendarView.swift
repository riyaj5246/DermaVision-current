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

//        VStack {

//            DatePicker(

//                "Start Date",

//                selection: $date,

//                displayedComponents: [.date]

//            )

//                .datePickerStyle(.graphical)

//                .accentColor(Color("Color2"))

//                .background(LinearGradient(gradient: Gradient(colors: [Color("Color4"), Color("Color3")]), startPoint: .top, endPoint: .bottom))

//            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {

//                print("hi")

//            }

//        }

//        .colorScheme(.light)

        CustomCalendarController()

        

    }

}



struct CalendarView_Previews: PreviewProvider {

    static var previews: some View {

        CalendarView()

    }

}



struct CustomCalendarController : UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomCalendarController>) -> UIViewController {

        let storyboard = UIStoryboard(name: "CalendarStory", bundle: Bundle.main)

        let controller = storyboard.instantiateViewController(withIdentifier: "calstory")

        return controller

    }

    

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomCalendarController>) {

    }

}
