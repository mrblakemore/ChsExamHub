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
    let pickerData = ["September 10th, 2022", "October 22nd, 2022", "December 10th, 2022", "February 11th, 2023", "April 15t, 2023", "June 10th, 2023", "July 15th, 2023"]
    
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
            testingDate.text = "September 10th, 2022"
            lateDeadline.text = "August 5th, 2022"
            lastDeadline.text = "August 19th, 2021"
        }
        else if( row == 1)
        {
            testingDate.text = "October 22nd, 2022"
            lateDeadline.text = "September 16th, 2022"
            lastDeadline.text = "September 30th, 2022"
        }
        else if( row == 2)
        {
            testingDate.text = "December 10th, 2022"
            lateDeadline.text = "November 4th, 2022"
            lastDeadline.text = "November 11th, 2022"
        }
        else if( row == 3)
        {
            testingDate.text = "February 11th, 2023"
            lateDeadline.text = "January 6th, 2023"
            lastDeadline.text = "January 20th, 2023"
        }
        else if( row == 4)
        {
            testingDate.text = "April 15th, 2023"
            lateDeadline.text = "March 10th, 2023"
            lastDeadline.text = "March 24th, 2023"
        }
        else if( row == 5)
        {
            testingDate.text = "June 10th, 2023"
            lateDeadline.text = "May 5th, 2023"
            lastDeadline.text = "May 19th, 2023"
        }
        else if( row == 6)
        {
            testingDate.text = "July 15th, 2023"
            lateDeadline.text = "June 16th, 2023"
            lastDeadline.text = "June 23rd, 2023"
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
