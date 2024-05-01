//
//  ViewController.swift
//  rutvik_ricky_assignment-2
//
//  Created by user212565 on 9/30/22.
//

import UIKit

class firstViewController: UIViewController {

   
    @IBOutlet weak var source: UITextField!
    
    @IBOutlet weak var destination: UITextField!
    
    @IBOutlet weak var litres: UITextField!
    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var destination_label: UILabel!

    @IBOutlet weak var litres_label: UILabel!
    @IBOutlet weak var output_gallons: UILabel!
    
    let format_no : NumberFormatter = {
       let numbers = NumberFormatter()
        numbers.numberStyle = .decimal
        numbers.minimumFractionDigits = 0
        numbers.maximumFractionDigits = 1
        return numbers
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        source.text = NSLocalizedString("Source", comment: " ")
        output_gallons.text = NSLocalizedString("Total Gallons", comment: " ")
        labelTest.text = NSLocalizedString("Source", comment: " ")
        destination_label.text = NSLocalizedString("Destination", comment: " ")
        litres_label.text = NSLocalizedString("Litres", comment: " ")
    }
    
    func textFieldShouldReturn(_ text : UITextField) -> Bool{
        if text == source {
            destination.becomeFirstResponder()
        }else if text == destination{           litres.becomeFirstResponder()
        }else if text == litres{
            text.resignFirstResponder()
        }
        return true
    }
    override func touchesBegan(_ touches : Set<UITouch>, with event : UIEvent?){
        self.view.endEditing(true)
    }
    
    
    @IBAction func add_button(_ send: Any) {
        let tab_Bar = tabBarController as! detailsBarController
        
        if source.text == "" || destination.text == "" || litres.text == ""{
            
        }else{
            tab_Bar.source_Array.append(source.text!)
            tab_Bar.destination_Array.append(destination.text!)
            
            let fuel_Double = Double(litres.text!)
            
            let fuel_Liter = Measurement(value: fuel_Double ?? 0.0, unit: UnitVolume.liters)
            let fuel_Gallon = fuel_Liter.converted(to: UnitVolume.gallons)
            
            tab_Bar.gas_Array.append(Double(fuel_Gallon.value))
            
            let total_Fuel = tab_Bar.gas_Array.reduce(0,+)
             
            let Fuel_Value = format_no.string(from: NSNumber(value: total_Fuel))
            
            output_gallons.text = Fuel_Value
        
    }
    
        
}

}


