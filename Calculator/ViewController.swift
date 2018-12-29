//
//  ViewController.swift
//  Calculator
//
//  Created by Yasin Isse on 2018-08-21.
//  Copyright © 2018 Yasin Isse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance variable to clear screen when not needed.
    var displayInUse = false
    
    // Instance variable to hold save the screen value for operations.
    var beforeDisplay = String()
    
    
    // Instance variable to hold the operator touched last.
    var currentOperator = String()
    
    
    // Operators buttons function
    @IBAction func touchOperations(_ sender: UIButton) {
        currentOperator =  sender.currentTitle!
        displayInUse = false
        beforeDisplay =  DisplayCalculator!.text!
    }
    
    // Equal button function
    @IBAction func touchEqual(_ sender: UIButton) {
        let firstTerm = Double (beforeDisplay)!
        let secondTerm = Double (DisplayCalculator!.text!)!
        displayInUse = false
        
        switch currentOperator {
        case "+":
            DisplayCalculator!.text! = String( firstTerm + secondTerm )
        case "-":
            DisplayCalculator!.text! = String( firstTerm - secondTerm)
        case "*":
            DisplayCalculator!.text! = String( firstTerm * secondTerm )
        case "/":
            DisplayCalculator!.text! = String( firstTerm / secondTerm )
        default: break
        }
    }
    
    // Alpha digits functions
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let textCurrentlyInDisplay = DisplayCalculator!.text!
        
        if displayInUse
        {
            DisplayCalculator!.text = textCurrentlyInDisplay + digit
        }
        else
        {
            DisplayCalculator!.text! = digit
            displayInUse = true
        }
    }
    
    // Display bar for calculator.
    @IBOutlet weak var DisplayCalculator: UILabel!
    
    // Numercal Value for the display bar to use. Auto updated to value.
    var displayValue: Double
    {
        get
        {
            return Double (DisplayCalculator!.text!)!
        }
        set
        {
            DisplayCalculator!.text! = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    // Operations for π and √ touch buttons.
    @IBAction func touchValue(_ sender: UIButton)
    {
        if displayInUse
        {
            brain.setOperand(displayValue)
            displayInUse = false
        }
        
        if let operationSymbol = sender.currentTitle
        {
            brain.performOperation(operationSymbol)
        }
        
        if let result = brain.result
        {
            displayValue = result
        }
    }
    
    
    @IBAction func touchClear(_ sender: UIButton) {
        displayInUse = false
        beforeDisplay = "0"
        currentOperator = ""
        DisplayCalculator!.text! = "0"
        
    }
    
    //
    
    
}

