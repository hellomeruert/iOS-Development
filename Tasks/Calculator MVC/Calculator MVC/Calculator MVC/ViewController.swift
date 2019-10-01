//
//  ViewController.swift
//  Calculator MVC
//
//  Created by Meruert Amambayeva on 9/17/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var typing: Bool = false
    var dotIsPlaced = false

    var displayValue:Double {
        get{
            return Double(displayLabel.text!)!
        }
        set{
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0"{
                displayLabel.text = "\(valueArray[0])"
            }else{
                displayLabel.text = "\(newValue)"
            }
            typing = false
        }
    }
    
    @IBAction func digitButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let display = displayLabel.text!
        if typing{
            if (displayLabel.text?.count)! < 14 {
            displayLabel.text! = display + digit
            }
        }else{
            displayLabel.text = digit
            typing = true
            dotIsPlaced = false
            }
    }
    var brain = CalculatorBrain()
    
    @IBAction func calcButton(_ sender: UIButton) {
        if typing{
            brain.setOperand(operand: displayValue)
            typing = false
        }
        if let math_symbol = sender.currentTitle{
            brain.performOperation(symbol: math_symbol)
        }
        displayValue = brain.result
    }
    }
    

    

