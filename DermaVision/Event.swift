//
//  Event.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

//


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseDatabase
import Firebase
import Combine


var eventsList = [Event]()

class Event: ObservableObject
{
    let ref = Database.database().reference()
    var id: Int!
//    var expense: Double!
    var name: String!
    var date: Date!
    var user: String!
    var daysEvents = [Event]()
    
    func eventsForDate(date: Date) -> [Event]{//receive date, return list of events{
        for event in eventsList
        {
            if(Calendar.current.isDate(event.date, inSameDayAs:date))//adding event to the day's total events if dates of event and day are same
            {
        ref.observeSingleEvent(of: .value) { [self] snapshot in

                    for case let child as DataSnapshot in snapshot.children {

                        guard let dict = child.value as? [String:Any] else {

                            print("Error")

                            return

                        }

                        let date = dict["date"] as Any

                        let id = dict["id"] as Any

                        let name = dict["name"] as Any

                        let user = dict["user"] as Any

                        guard let userID = Auth.auth().currentUser?.uid else { return }

//                        if(userID == user as? String){

                            let newEvent = Event()

                            newEvent.date = date as? Date

                            newEvent.id = id as? Int

                            newEvent.name = name as? String

                            newEvent.user = user as? String

//                            _replDebugPrintln("EVENT")

//                            self.daysEvents.append(newEvent)

//                            _replDebugPrintln(daysEvents)

//                            _replDebugPrintln("name" + newEvent.name)

                        print(date)

                        print(id)

                        print(name)

                        print(user)

//                        }

                    }

                    _replDebugPrintln("")

                }

                daysEvents.append(event)

            }

        }

//        _replDebugPrintln("DAYSEVENTS")

        _replDebugPrintln(daysEvents)

        return daysEvents

    }

}
