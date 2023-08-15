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
    let pickerData = ["August 26th, 2023", "October 7th, 2023", "October 26th, 2023", "November 4th, 2023", "December 2nd, 2023", "March 9th, 2024", "May 4th, 2024", "June 1st, 2024" ]
    
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
            testingDate.text = "August 26th, 2023"
            lateDeadline.text = "July 28th, 2023"
            lastDeadline.text = "August 15th, 2023"
            
        }
//        else if( row == 1)
//        {
//            testingDate.text = "September 26th, 2020"
//            lateDeadline.text = "August 26th, 2020"
//            lastDeadline.text = "September 15th, 2020"
//        }
    
        else if( row == 1)
        {
            testingDate.text = "October 7th, 2023"
            lateDeadline.text = "September 7th, 2023"
            lastDeadline.text = "September 26th, 2023"
        }
            
        else if( row == 2)
        {
            testingDate.text = "October 26th, 2023"
            lateDeadline.text = "October 7th, 2022"
            lastDeadline.text = "October 25th, 2022"
        }
            
        else if( row == 3)
        {
            testingDate.text = "November 4th, 2023"
            lateDeadline.text = "October 5th, 2023"
            lastDeadline.text = "October 24th, 2023"
        }
            
        else if( row == 4)
        {
            testingDate.text = "December 2nd, 2023"
            lateDeadline.text = "November 2nd, 2023"
            lastDeadline.text = "November 21st, 2023"
        }
            
        else if( row == 5)
        {
            testingDate.text = "March 9th, 2024"
            lateDeadline.text = "February 23rd, 2024"
            lastDeadline.text = "February 27th, 2024"
        }
        else if( row == 6)
        {
            testingDate.text = "May 4th, 2024"
            lateDeadline.text = "April 19th, 2024"
            lastDeadline.text = "April 23rd, 2024"
        }
        else if( row == 7)
        {
            testingDate.text = "June 1st, 2024"
            lateDeadline.text = "May 17th, 2024"
            lastDeadline.text = "May 21st, 2024"
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
