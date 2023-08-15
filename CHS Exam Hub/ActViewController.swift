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
    let pickerData = ["September 9th, 2023", "October 28th, 2023", "December 9th, 2023", "February 10th, 2024", "April 13th, 2024", "June 8th, 2024", "July 13th, 2024"]
    
    var testSession = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sessionPicker.delegate = self
        self.sessionPicker.dataSource = self
        
        //let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        //backgroundImage.image = UIImage(named: "ACT.jpg")
        //backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        //self.view.insertSubview(backgroundImage, at: 0)
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
            testingDate.text = "September 9th, 2023"
            lateDeadline.text = "August 4th, 2023"
            lastDeadline.text = "August 18th, 2023"
        }
        else if( row == 1)
        {
            testingDate.text = "October 28th, 2023"
            lateDeadline.text = "September 22nd, 2023"
            lastDeadline.text = "October 6th, 2023"
        }
        else if( row == 2)
        {
            testingDate.text = "December 9th, 2023"
            lateDeadline.text = "November 3rd, 2023"
            lastDeadline.text = "November 17th, 2023"
        }
        else if( row == 3)
        {
            testingDate.text = "February 10th, 2024"
            lateDeadline.text = "January 5th, 2024"
            lastDeadline.text = "January 19th, 2024"
        }
        else if( row == 4)
        {
            testingDate.text = "April 13th, 2024"
            lateDeadline.text = "March 8th, 2024"
            lastDeadline.text = "March 22nd, 2024"
        }
        else if( row == 5)
        {
            testingDate.text = "June 8th, 2024"
            lateDeadline.text = "May 3rd, 2024"
            lastDeadline.text = "May 17th, 2024"
        }
        else if( row == 6)
        {
            testingDate.text = "July 13th, 2024"
            lateDeadline.text = "June 7th, 2024"
            lastDeadline.text = "June 21st, 2024"
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
