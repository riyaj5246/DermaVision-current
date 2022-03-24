//
//  WeeklyViewController.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import UIKit

var selectedDate = Date()

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                            UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var balanceLabel: UILabel!

    var totalSquares = [Date]()
    var resultTwo = ""
    var checkResultTwo = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setWeekView()
    }

    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 7
        let height = (collectionView.frame.size.height - 2)//was -2
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        flowLayout.itemSize = CGSize(width: width, height: height)
    }


    func setWeekView()

    {

        totalSquares.removeAll()

        

        var current = CalendarHelper().sundayForDate(date: selectedDate)

        let nextSunday = CalendarHelper().addDays(date: current, days: 7)

        

        while (current < nextSunday)

        {

            totalSquares.append(current)

            current = CalendarHelper().addDays(date: current, days: 1)

        }

        

        monthLabel.text = CalendarHelper().monthString(date: selectedDate)

            + " " + CalendarHelper().yearString(date: selectedDate)

        collectionView.reloadData()

        tableView.reloadData()

    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        totalSquares.count

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell

        

        let date = totalSquares[indexPath.item]

        cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))

        

        if(date == selectedDate)

        {

            cell.backgroundColor = UIColor.systemGreen

        }

        else

        {

            cell.backgroundColor = UIColor.white

        }

        

        

        

        return cell

    }

    

    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)

    {

        selectedDate = totalSquares[indexPath.item]//selected cell

        collectionView.reloadData()

        tableView.reloadData()

    }

    

    @IBAction func previousWeek(_ sender: Any)

    {

        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)

        setWeekView()

    }

    

    @IBAction func nextWeek(_ sender: Any)

    {

        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)

        setWeekView()

    }

    

    override open var shouldAutorotate: Bool

    {

        return false

    }

    

    

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

    {

        return Event().eventsForDate(date: selectedDate).count//number of events on date

    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell

        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]

//        cell.eventLabel.text = event.name + ", " + String(event.expense) + ", Time: " + CalendarHelper().timeString(date: event.date)

        cell.eventLabel.text = event.name + ", Time: " + CalendarHelper().timeString(date: event.date)

        return cell//each event

    }

    



    override func viewDidAppear(_ animated: Bool)

    {

        if (!resultTwo.elementsEqual("")) {

//            var num: Double = 0

//            for e in eventsList{

//                num+=e.expense

//            }

//            num += (resultTwo as NSString).doubleValue

//            balanceLabel.text = "Current Balance: $" + String(num)

        }

        super.viewDidAppear(animated)

        tableView.reloadData()

    }

    

}
