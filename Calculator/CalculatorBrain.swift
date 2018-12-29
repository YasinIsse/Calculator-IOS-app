//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Yasin Isse on 2018-12-29.
//  Copyright © 2018 Yasin Isse. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation
    {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operations: Dictionary<String,Operation> =
        [
            "π" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation, // sqrt
            "cos" : Operation.unaryOperation  // cos
        ]
    
    
    mutating func performOperation(_ symbol: String)
    {
        if let operation = operations[symbol] {
        
        switch operation {
            
        case .constant(let value):
            accumulator = value
            
        case .unaryOperation:
            break
                  }
        }
    }
    
    mutating func setOperand (_ operand: Double)
    {
        accumulator = operand
    }
    
    var result: Double?
    {
        get
        {
            return accumulator
        }
    }
    
}
