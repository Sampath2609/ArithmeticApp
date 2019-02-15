//
//  ViewController.swift
//  ArithMetic App
//
//  Created by Student on 2/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var input:String = " "
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        input = pickerData[row]
    }

  //  @IBOutlet weak var ActivityTF: UITextField!
    
    @IBOutlet weak var WeightTF: UITextField!
    
    @IBOutlet weak var ExcerTimeTF: UITextField!
    @IBOutlet weak var EnergyLBL: UILabel!
    
    
    @IBOutlet weak var TimeLBL: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
        var pickerData: [String] = [String]()
    
    @IBAction func calculate(_ sender: Any) {
        
        let weight1 = Double(WeightTF.text!)
        let time1 = Double(ExcerTimeTF.text!)
        
        
        
        EnergyLBL.text = String(format:"%.1f",ExerciseCoach.energyConsumed(during: input, weight: weight1 ?? 0.0, time: time1 ?? 0.0)) + " cal"
        TimeLBL.text = String(format: "%.1f", ExerciseCoach.timeToLose1Pound(during: input, weight: weight1 ?? 0.0)) + " minutes"
    }
    
    
    @IBAction func clear(_ sender: Any) {
        //ActivityTF.text = " "
        WeightTF.text = " "
        ExcerTimeTF.text = " "
        EnergyLBL.text = "0.0 cal"
        TimeLBL.text = "0.0 minutes"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Bicycling", "Jumping rope", "Running-slow", "Running-fast", "Tennis", "Swimming"]
    }

    
    struct ExerciseCoach{
        
        
        static let sports:[String:Double] = ["Bicycling" : 8.0, "Jumping rope" : 12.3,"Running-slow": 9.8,"Running-fast": 23.0, "Tennis" : 8.0, "Swimming" : 5.8]
     
        static func energyConsumed(during: String,weight: Double,time: Double) -> Double {
            let met = sports[during]!
           
           return  met * 3.5 * weight/2.2/200 * time
            
         
            
        }
        static func timeToLose1Pound(during:String,weight:Double) -> Double {
            
            let met = sports[during]!
         
            return 3500/( met * 3.5 * weight/2.2/200)
            
        }
        
        
    }

}
