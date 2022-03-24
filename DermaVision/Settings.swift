//
//  Settings.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import UIKit


class Settings: UIViewController{

    @IBOutlet weak var txtField: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//using segueway to send balance to viewcontroller

        let viewcontroller = segue.destination as! ViewController2

        viewcontroller.result = txtField.text!

        }
}

