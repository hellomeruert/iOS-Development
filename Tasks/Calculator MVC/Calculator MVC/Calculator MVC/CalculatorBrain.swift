//
//  CalculatorBrain.swift
//  Calculator MVC
//
//  Created by Meruert Amambayeva on 9/17/19.
//  Copyright © 2019 Meruert Amambayeva. All rights reserved.
//

import Foundation

//func multiply (op1:Double, op2:Double)->Double{
//    return op1*op2
//
//}

class CalculatorBrain{
    var accumulator = 0.0
    
    var Operations:Dictionary<String, operation> = [
        "√": operation.UnaryOperation(sqrt),
        "×": operation.BinaryOperation({$0 * $1}),
        "-": operation.BinaryOperation({$0 - $1}),
        "÷": operation.BinaryOperation({$0 / $1}),
        "+": operation.BinaryOperation({$0 + $1}),
        "=": operation.Equals,
        "AC": operation.Clear,
        "e": operation.Constant(M_E),
        "π": operation.Constant(M_PI),
        "ln": operation.Constant(M_LN2),
         "+/-" : operation.UnaryOperation({-$0}),
        
//        "%": operation.Percentage
    ]
    enum operation{
        case Constant(Double)
        case UnaryOperation((Double)->(Double))
        case BinaryOperation((Double, Double)->Double)
        case Equals
        case Clear
        case PlusMinus
//        case Percentage
    }
    func clear(){
        accumulator = 0.0
    }
    func plus_minus(){
        accumulator = -accumulator
    }
    func setOperand(operand: Double){
        accumulator = operand
    }
  
    func performOperation(symbol:String){
        if let operation = Operations[symbol]{
            switch operation{
            
            case .Constant(let value):accumulator = value
            case .UnaryOperation(let function):  accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executeEquals()
                pending = pendingBinaryOperation(binaryOperation: function, firstOperand: accumulator)
            case .Equals: executeEquals()
            case .Clear: clear()
            case .PlusMinus:plus_minus()
//            case .Percentage:percentage()
            }
        }
    }

    func executeEquals() {
    if pending != nil{
    accumulator = pending!.binaryOperation(pending!.firstOperand, accumulator)
    pending = nil
        }
    
    }
    var pending: pendingBinaryOperation?
    
    struct pendingBinaryOperation{
        var binaryOperation: (Double, Double) -> Double
        var firstOperand: Double
    }
    var result:Double{
        get{
            return accumulator
        }
    }
}
