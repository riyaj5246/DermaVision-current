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



class CellClass: UIViewController{

    

}



class EventEditViewController: UIViewController

{

    private let ref = Database.database().reference()

    let transparentView = UIView()

    let tableView = UITableView()

    var selectedButton = UIButton()

    var dataSource = [String]()

    var selectedTitle = ""

    @IBOutlet weak var btnSelectLesion: UIButton!

    @IBOutlet weak var nameTF: UITextField!

    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var amountLbl: UITextField!

    @IBOutlet weak var `switch`: UISwitch!

    @IBOutlet weak var incomeLbl: UILabel!

    var amount = 0;

    func addTransparentView(frames: CGRect) {

        let window = UIApplication.shared.keyWindow

        transparentView.frame = window?.frame ?? self.view.frame

        self.view.addSubview(transparentView)

        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)

        self.view.addSubview(tableView)

        tableView.layer.cornerRadius = 5

        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)

        tableView.reloadData()

        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))

        transparentView.addGestureRecognizer(tapgesture)

        transparentView.alpha = 0

        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {

            self.transparentView.alpha = 0.5

            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 500)//change height from CGFloat(self.dataSource.count*50)

            }, completion: nil)

    }

    

    @objc func removeTransparentView() {

        let frames = selectedButton.frame

             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {

                 self.transparentView.alpha = 0

                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 0)

             }, completion: nil)

         }

    

    @IBAction func OnClickSelectLesion(_ sender: Any) {

        dataSource = ["Low Level Breakout", "Medium Level Breakout", "High Level Breakout", "Drank Water", "Applied Suncreen", "Forgot Sunscreen", "Didn't drink enough Water", "Assymetrical Lesion", "Evenly Bordered Lesion", "Irregularly Bordered Lesion", "Lesion is shade of Brown", "Lightly Colored Lesion", "Multi-colored Lesion", "Extremely Dark Lesion", "Lesion grew Larger"]

        selectedButton = btnSelectLesion

        addTransparentView(frames: btnSelectLesion.frame)

    }

    

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

        tableView.delegate = self

        tableView.dataSource = self

//        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        datePicker.date = selectedDate//current date, setting datepicker date equal to current

    }

    

    @IBAction func saveAction(_ sender: Any)

    {

        let newEvent = Event()//saving attributes of event when saving

        _replDebugPrintln(selectedTitle)

        newEvent.id = eventsList.count

        if(selectedTitle.isEmpty && nameTF.hasText){

            newEvent.name = nameTF.text!

        }else if (!nameTF.hasText && !selectedTitle.isEmpty){

            newEvent.name = selectedTitle

        }else if (nameTF.hasText && !selectedTitle.isEmpty){

            newEvent.name = selectedTitle + ", " + nameTF.text!

        }else{

            newEvent.name = ""

        }

//        newEvent.name = selectedTitle + ", " + nameTF.text!

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



    extension EventEditViewController: UITableViewDelegate, UITableViewDataSource{

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return dataSource.count

        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            cell.textLabel?.text = dataSource[indexPath.row]

            return cell

        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 50

        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            selectedButton.setTitle(dataSource[indexPath.row], for: .normal)

            selectedTitle = dataSource[indexPath.row]

    //        _replDebugPrintln(dataSource[indexPath.row])

            removeTransparentView()

        }

    }
