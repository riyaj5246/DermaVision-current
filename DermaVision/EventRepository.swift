//
//  EventRepository.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class EventRepository: ObservableObject {
    let db = Firestore.firestore()
    @Published var event = [Event]()
    func loadData() {
        db.collection("event").addSnapshotListener{(QuerySnapshot, error) in
//            if let querySnapshot = QuerySnapshot {
//                self.event = querySnapshot.documents.compactMap{ document in
//                    try? document.data(as: Event.self)
//                }
//            }
        }
    }
}
