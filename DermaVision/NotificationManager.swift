//
//  NotificationManager.swift
//  DermaVision
//
//  Created by Riya Jain on 3/6/22.
//

import Foundation
import UserNotifications


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
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "First notif"
        content.subtitle = "NOtif subtitle"
        content.sound = .default
        content.badge = 1
        
        //time
        // trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 19
        
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
