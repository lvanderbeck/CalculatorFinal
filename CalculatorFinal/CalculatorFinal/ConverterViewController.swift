//
//  ConverterViewController.swift
//  CalculatorFinal
//
//  Created by Logan VanDerBeck on 12/11/17.
//  Copyright © 2017 Logan VanDerBeck. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    var inputNum:Double = 0
    var outputNum: Double = 0
    var nums: String = ""
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    
    var converters: [Converter] = [Converter]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converters = [
            Converter(label: "Fahrenheit to Celcius", inputUnit: "°F", outputUnit: "°C"),
            Converter(label: "Celcius to Fahrenheit", inputUnit: "°C", outputUnit: "°F"),
            Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
            Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")
        ]
        inputDisplay.textAlignment = NSTextAlignment.right
        outputDisplay.textAlignment = NSTextAlignment.right
        inputDisplay.text = converters[0].inputUnit
        outputDisplay.text = converters[0].outputUnit
        
        
        
        
    }
    
    func fahreinheitCel(inputNum: Double) -> Double {
        var outputNum:Double
        outputNum = (inputNum - 32) * (5/9)
        return outputNum
    }
    
    func celFahreinheit(inputNum: Double) -> Double {
        var outputNum:Double
        outputNum = (inputNum * (9/5) + 32)
        return outputNum
    }
    func kilometersMiles(inputNum: Double) -> Double {
        var outputNum: Double
        outputNum = inputNum * 0.62137
        
        return outputNum
    }
    func milesKilometers(inputNum: Double) -> Double {
        var outputNum: Double
        
        outputNum = inputNum * 1.60934
        
        return outputNum
    }
    
    @IBAction func converterButton(_ sender: UIButton) {
        let event = UIAlertController( title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        for converter in converters
        {
            event.addAction(UIAlertAction( title: converter.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                self.outputDisplay.text = converter.outputUnit
                self.inputDisplay.text = converter.inputUnit
                self.inputDisplay.textAlignment = NSTextAlignment.right
                self.outputDisplay.textAlignment = NSTextAlignment.right
            }))
        }
        
        event.addAction(UIAlertAction( title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(event, animated: true, completion: nil)
    }
    
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if sender.tag != 11
        {
            if sender.tag == 12 {
                if inputNum == 0 {
                    return
                }
                if outputDisplay.text!.contains("°C") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " °F"
                    outputNum = fahreinheitCel(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " °C"
                } else if outputDisplay.text!.contains("°F") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " °C"
                    outputNum = celFahreinheit(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " °F"
                } else if outputDisplay.text!.contains("km") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " mi"
                    outputNum = milesKilometers(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " km"
                    
                } else if outputDisplay.text!.contains("mi") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " km"
                    outputNum = kilometersMiles(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " mi"
                }
            }
            else if sender.tag == 13
            {   if inputDisplay.text!.contains(".") {
                return
                }
                if outputDisplay.text!.contains("°C") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " °F"
                    
                } else if outputDisplay.text!.contains("°F") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " °C"
                } else if outputDisplay.text!.contains("km") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " mi"
                } else if outputDisplay.text!.contains("mi") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " km"
                }
            }
        } else if sender.tag == 11 {
            inputNum = 0
            outputNum = 0
            nums = ""
            if outputDisplay.text!.contains("°C") {
                inputDisplay.text = "°F"
                outputDisplay.text = "°C"
            } else if outputDisplay.text!.contains("°F") {
                inputDisplay.text = "°C"
                outputDisplay.text = "°F"
            } else if outputDisplay.text!.contains("km") {
                inputDisplay.text = "mi"
                outputDisplay.text = "km"
            } else if outputDisplay.text!.contains("mi") {
                inputDisplay.text = "km"
                outputDisplay.text = "mi"
            }
        }
        
        
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if (outputDisplay.text!.contains("°C")) {
            
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " °F"
            inputNum = Double(nums)!
            outputNum = fahreinheitCel(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " °C"
        }
        else if outputDisplay.text!.contains("°F")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " °C"
            inputNum = Double(nums)!
            outputNum = celFahreinheit(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " °F"
            
        } else if outputDisplay.text!.contains("km")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " mi"
            inputNum = Double(nums)!
            outputNum = milesKilometers(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " km"
        } else if outputDisplay.text!.contains("mi")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " km"
            inputNum = Double(nums)!
            outputNum = kilometersMiles(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " mi"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
