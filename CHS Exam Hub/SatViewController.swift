//
//  SatViewController.swift
//  CHS Exam Hub
//
//  Created by Robby Blakemore on 12/5/17.
//  Copyright © 2017 Robby Blakemore. All rights reserved.
//

import UIKit

class SatViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var sessionPicker: UIPickerView!
    @IBOutlet weak var testingDate: UILabel!
    @IBOutlet weak var lastDeadline: UILabel!
    
    @IBOutlet weak var lateDeadline: UILabel!
    
    //Add dates here
    let pickerData = ["August 28th, 2021", "October 2nd, 2021", "November 6th, 2021", "December 4th, 2021 ", "March 12th, 2022", "May 7th, 2022", "June 4th, 2022" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sessionPicker.delegate = self
        self.sessionPicker.dataSource = self
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "SAT.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        sessionPicker.setValue(UIColor.black, forKey: "textColor")
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
        //probably wrong
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if( row == 0)
        {
            testingDate.text = "August 28th, 2021"
            lateDeadline.text = "July 30th, 2021"
            lastDeadline.text = "August 17th, 2021"
            
        }
//        else if( row == 1)
//        {
//            testingDate.text = "September 26th, 2020"
//            lateDeadline.text = "August 26th, 2020"
//            lastDeadline.text = "September 15th, 2020"
//        }
    
        else if( row == 1)
        {
            testingDate.text = "October 2nd, 2021"
            lateDeadline.text = "September 3rd, 2021"
            lastDeadline.text = "September 21st, 2021"
        }
            
        else if( row == 2)
        {
            testingDate.text = "November 6th, 2021"
            lateDeadline.text = "October 8th, 2021"
            lastDeadline.text = "October 26th, 2021"
        }
            
        else if( row == 3)
        {
            testingDate.text = "December 4th, 2021"
            lateDeadline.text = "November 4th, 2021"
            lastDeadline.text = "November 23rd, 2021"
        }
            
        else if( row == 4)
        {
            testingDate.text = "March 12th, 2022"
            lateDeadline.text = "February 11th, 2022"
            lastDeadline.text = "March 1st, 2022"
        }
            
        else if( row == 5)
        {
            testingDate.text = "May 7th, 2022"
            lateDeadline.text = "April 8th, 2022"
            lastDeadline.text = "April 26th, 2022 "
        }
        else if( row == 6)
        {
            testingDate.text = "June 4th, 2022"
            lateDeadline.text = "May 5th, 2022"
            lastDeadline.text = "May 25th, 2022 "
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
