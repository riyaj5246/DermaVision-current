//
//  Task.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import SwiftUI

//Task Model and Sample Tasks
//Array of Tasks...
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

//Sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks = [TaskMetaData]()
//sample descriptions for testing
//tasks = [
//    TaskMetaData(task: [
//        Task(title: "zdmfnsdjflksdjfl"),
//        Task(title: "sdkjfskdjfhkjdshf"),
//        Task(title: "skdjfhskdjhfkjsdh"),
//    ], taskDate: getSampleDate(offset: 1)),
//    TaskMetaData(task: [
//        Task(title: "sdmnfbsmdnfb"),
//    ], taskDate: getSampleDate(offset: -3)),
//    TaskMetaData(task: [
//        Task(title: "skfnkrnlre"),
//    ], taskDate: getSampleDate(offset: -8)),
//    TaskMetaData(task: [
//        Task(title: "awehwnr,hfiuvyciosuyd"),
//    ], taskDate: getSampleDate(offset: 10)),
//    TaskMetaData(task: [
//        Task(title: "awehwnr,hfiuvyciosuyd"),
//    ], taskDate: getSampleDate(offset: -22)),
//    TaskMetaData(task: [
//        Task(title: "awehwnr,hfiuvyciosuyd"),
//    ], taskDate: getSampleDate(offset: 15)),
//    TaskMetaData(task: [
//        Task(title: "awehwnr,hfiuvyciosuyd"),
//    ], taskDate: getSampleDate(offset: -20)),
//
//]
