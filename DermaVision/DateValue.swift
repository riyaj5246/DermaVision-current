//
//  DateValue.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import SwiftUI

//Date value Model...
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
