//
//  ActViewController.swift
//  CHS Exam Hub
//
//  Created by Robby Blakemore on 12/5/17.
//  Copyright © 2017 Robby Blakemore. All rights reserved.
//

import UIKit

class ActViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    @IBOutlet weak var testingDate: UILabel!
    @IBOutlet weak var lateDeadline: UILabel!
    @IBOutlet weak var lastDeadline: UILabel!
    @IBOutlet weak var sessionPicker: UIPickerView!
    
    //Add dates here
    let pickerData = ["September 11th, 2021", "October 23rd, 2021", "December 11th, 2021", "February 12th, 2022", "April 2nd, 2022", "June 11th, 2022", "July 16th, 2022"]
    
    var testSession = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sessionPicker.delegate = self
        self.sessionPicker.dataSource = self
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "ACT.jpg")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        sessionPicker.setValue(UIColor.black, forKey: "textColor")
        
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
            testingDate.text = "September 11th, 2021"
            lateDeadline.text = "August 6th, 2021"
            lastDeadline.text = "August 20th, 2021"
        }
        else if( row == 1)
        {
            testingDate.text = "October 23rd, 2021"
            lateDeadline.text = "September 17th, 2021"
            lastDeadline.text = "October 1st, 2021"
        }
        else if( row == 2)
        {
            testingDate.text = "December 11th, 2021"
            lateDeadline.text = "November 5th, 2021"
            lastDeadline.text = "November 19th, 2021"
        }
        else if( row == 3)
        {
            testingDate.text = "February 12th, 2022"
            lateDeadline.text = "January 7th, 2022"
            lastDeadline.text = "January 21st, 2022"
        }
        else if( row == 4)
        {
            testingDate.text = "April 2nd, 2022"
            lateDeadline.text = "February 25th, 2022"
            lastDeadline.text = "March 11th, 2022"
        }
        else if( row == 5)
        {
            testingDate.text = "June 11th, 2022"
            lateDeadline.text = "May 6th, 2022"
            lastDeadline.text = "May 20th, 2022"
        }
        else if( row == 6)
        {
            testingDate.text = "July 16th, 2022"
            lateDeadline.text = "June 17th, 2022"
            lastDeadline.text = "June 24th, 2022"
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
