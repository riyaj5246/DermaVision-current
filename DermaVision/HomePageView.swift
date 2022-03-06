//
//  HomePageView.swift
//  DermaVision
//
//  Created by Riya Jain on 2/4/22.
//

import SwiftUI
import UserNotifications

struct HomePageView: View {
    @State var forecast = [[String]]()
    @State var personName = "Riya"
    @State private var currentDate = Date()

    
    var body: some View {
        ScrollView {
            VStack {
                Text("""
                     Welcome,
                     \(personName)!
                     """)
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .foregroundColor(Color("Color2"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, -140.0)
                    .onAppear{
                        let x = getData()
                        var counter = 0
                        forecast.removeAll()
                        while counter < 24 {
                            forecast.append(x[counter])
                            counter += 1
                        }
                       // forecast = getData()
                    }
                
                
                Text("Here's the upcoming UV Forecast:")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color1"))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                List(forecast, id: \.self) { day in forecastListItemView(arrayItem: day)
                    }
                    .padding(.top, -10)
                    .frame(width: 500.0, height: 500.0)
                    

                
                Spacer()
                

                HStack {
                    Text("Daily Morning Reminder")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color1"))
                    DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .font(.system(size: 15))
                        .foregroundColor(Color("Color4"))

                }
                Button("Set and Save Reminder Time") {
                    let calendar = Calendar.current
                    let hr = calendar.component(.hour, from: currentDate)
                    let minute = calendar.component(.minute, from: currentDate)
                    
                    NotificationManager.instance.cancelNotification()
                    NotificationManager.instance.scheduleNotification(min: minute, hr: hr, name: personName)

                    print("\(hr), \(minute)")
                }
                .font(.system(size: 18))
                .foregroundColor(Color("Color3"))
                .padding()
                .background(RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                                .fill(Color("Color2"))
                                .shadow(radius: 2))
        
                
            }
        }
        .colorScheme(.light)
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
            NotificationManager.instance.requestAuthorization()
        }
    
    }
        
}

class NotificationManager {
    static let instance = NotificationManager() //singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            }
            else{
                print("Success")
            }
        }
    }
    
    func scheduleNotification(min: Int, hr: Int, name: String){
        let content = UNMutableNotificationContent()
        content.title = "Good Morning, \(name)!☀️☀️"
        content.subtitle = "Remember to apply SPF before going outside!"
        content.sound = .default
        content.badge = 1
        
        //time
        // trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = hr
        dateComponents.minute = min
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //location
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}


struct forecastListItemView: View {
    
    var arrayItem: [String]
    var body: some View {
        HStack(alignment: .top) {
            Text(arrayItem[0])
                .font(.system(size: 17))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .frame(width: 150, height: 50)
                .foregroundColor(Color("Color2"))
                .font(.headline)
                
               
            Text(arrayItem[1])
                .font(.system(size: 23))
                .fontWeight(.light)
                .multilineTextAlignment(.trailing)
                .lineLimit(3)
                .frame(width: 150, height: 50)
                .foregroundColor(Color("Color2"))
                .font(.body)
             
            if arrayItem[2] == "High" {
                Text(arrayItem[2])
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Circle()
                                    .fill(.red)
                                    .opacity(0.7))

            }
            else if arrayItem[2] == "Med" {
                Text(arrayItem[2])
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 100, height: 50)
                    .background(Circle()
                                    .fill(.yellow)
                                    .opacity(0.7))
            }
            else {
                Text(arrayItem[2])
                    .foregroundColor(.white)
                    .fontWeight(.bold)

                    .frame(width: 100, height: 50)
                    .background(Circle()
                                    .fill(.green)
                                    .opacity(/*@START_MENU_TOKEN@*/0.7/*@END_MENU_TOKEN@*/)
                                    )

            }
                
        }
        .padding(9.0)
//        .background(Rectangle()
//                        .fill(Color("Color1")))
        
        .background(LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color4")]), startPoint: .trailing, endPoint: .leading))
        //.frame(width: -1.0, height: 51.0)

        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
