//
//  EventEditViewController.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.

import UIKit

import Foundation

import Combine

import FirebaseDatabase

import Firebase



class EventEditViewController: UIViewController

{

    private let ref = Database.database().reference()



    @IBOutlet weak var nameTF: UITextField!

    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var amountLbl: UITextField!

    @IBOutlet weak var `switch`: UISwitch!

    @IBOutlet weak var incomeLbl: UILabel!

    var amount = 0;

    

    @IBAction func switchPressed(_ sender: Any) {

        if(incomeLbl.text=="Income"){

            incomeLbl.text = "Expense"

        }else{

            incomeLbl.text = "Income"

        }

    }

    override func viewDidLoad()

    {

        super.viewDidLoad()

                

        datePicker.date = selectedDate//current date, setting datepicker date equal to current

    }

    

    @IBAction func saveAction(_ sender: Any)

    {

        let newEvent = Event()//saving attributes of event when saving

        newEvent.id = eventsList.count

        newEvent.name = nameTF.text

        newEvent.date = datePicker.date

//        if(amountLbl.text==nil){

//            newEvent.expense = 0

//        }else{

//            newEvent.expense = Double(amountLbl.text!)

//            if(!`switch`.isOn){

//                newEvent.expense = (amountLbl.text! as NSString).doubleValue*(-1)

//            }

//        }

        guard let userID = Auth.auth().currentUser?.uid else { return }

        ref.child("event_\(Int.random(in: 0..<100))").setValue(["date":DateFormatter.localizedString(from: newEvent.date, dateStyle: .short, timeStyle: .none), "id": String(newEvent.id), "name": String(newEvent.name), "user": String(userID)])

//        _replDebugPrintln("user" + String(userID))

        eventsList.append(newEvent)//add event to events list

        navigationController?.popViewController(animated: true)//go back to previous

    }

}
