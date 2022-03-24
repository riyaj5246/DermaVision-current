//
//  ViewController2.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import UIKit

import FirebaseFirestore

import Firebase

import FirebaseDatabase

class ViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource

{

    @IBOutlet weak var monthLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var balance: UILabel!

    

    

    var totalSquares = [String]()//array of strings

    var result = ""

    private let ref = Database.database().reference()



    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//send balance from viewcontroller to weekly view controller

        if segue.identifier == "segueTwo"{

        let weeklyViewController = segue.destination as! WeeklyViewController

        weeklyViewController.resultTwo = result

        }

    }

    

    override func viewDidLoad()

    {

        super.viewDidLoad()



//        ref.observe(.value, with: { snapshot in

//          print(snapshot.value as Any)

//          print("EVENT DONE")

//        })//WORKS

//        ref.observeSingleEvent(of: .value) { snapshot in

//            for case let child as DataSnapshot in snapshot.children {

//                guard let dict = child.value as? [String:Any] else {

//                    print("Error")

//                    return

//                }

//                let date = dict["date"] as Any

//                let id = dict["id"] as Any

//                let name = dict["name"] as Any

//                let user = dict["user"] as Any

//                print(date)

//                print(id)

//                print(name)

//                print(user)

//                print("NEXT")

//            }

//        }



        setCellsView()

        setMonthView()

        

    }

    

    override func viewDidAppear(_ animated: Bool) {//once view is loaded from another vieww

        if (!result.isEmpty) {

//            var tot: Double = 0

//            for e in eventsList{

//                tot+=e.expense

//            }

//            tot += (result as NSString).doubleValue

//            balance.text = "Current Balance: $" + String(tot)

        }

    }

    

    func setCellsView()

    {

        let width = (collectionView.frame.size.width - 2) / 7//was 10sets padding of cells

        let height = (collectionView.frame.size.height - 2) / 6//was 11

        

        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        flowLayout.itemSize = CGSize(width: width, height: height)//giving the cells width and height

    }

    

    func setMonthView()

    {

        totalSquares.removeAll()

        

        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)//selected date is today's data

        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)

        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)

        

        var count: Int = 1

        

        while(count <= 42)//number of squares populated(6 x 7)

        {

            if(count <= startingSpaces || count - startingSpaces > daysInMonth)//check blank spaces before the start of month or however many days are leftover to fill sixth row

            {

                totalSquares.append("")

            }

            else

            {

                totalSquares.append(String(count - startingSpaces))

            }

            count += 1

        }

        

        monthLabel.text = CalendarHelper().monthString(date: selectedDate)

            + " " + CalendarHelper().yearString(date: selectedDate)

        collectionView.reloadData()

    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

         totalSquares.count

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell

        

        cell.dayOfMonth.text = totalSquares[indexPath.item]//setting numbers in cell

        

        return cell

    }

    

    @IBAction func previousMonth(_ sender: Any)

    {

        selectedDate = CalendarHelper().minusMonth(date: selectedDate)

        setMonthView()

    }

    

    @IBAction func nextMonth(_ sender: Any)

    {

        selectedDate = CalendarHelper().plusMonth(date: selectedDate)

        setMonthView()

    }

    

    override open var shouldAutorotate: Bool

    {

        return false

    }

}
