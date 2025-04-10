//
//  CalculatorLogic.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 10.04.25.
//

import Foundation

class CalculatorLogic {
    
    private var isLastNumber = false
    var numberArray = [String]()
    var historyArray = [[String]] ()
    var text = ""
    
    //MARK: -Calculate func
    private func calc (expression: [String]) -> String {
        guard !expression.isEmpty else { return "0" }
        
        let numbers = numberSeparateOperators(expression).numbers
        let operators = numberSeparateOperators(expression).operators
        
        guard numbers.count == operators.count + 1 else {
            return "Error"
        }
        
        var result = numbers[0]
        
        for i in 0..<operators.count {
            let nextNumber = numbers[i+1]
            
            switch operators[i] {
            case "+":
                result += nextNumber
            case "-":
                result -= nextNumber
            case "x":
                result *= nextNumber
            case "/":
                if nextNumber == 0 {
                    return "Error: division by zero"
                }
                result /= nextNumber
            default:
                return "Error: unknown operator"
            }
        }
        return round(result)
    }
    //MARK: -add number Array
    func add(button: CustomButton) {
        
        switch button.btn {
        case .Zero, .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine:
            if isLastNumber, !numberArray.isEmpty {
                numberArray[numberArray.count - 1] = (numberArray.last ?? "") + button.btn.rawValue
            } else {
                numberArray.append(button.btn.rawValue)
                isLastNumber = true
            }
        case .Point:
            if numberArray.isEmpty || !isLastNumber {
                numberArray.append("0.")
                isLastNumber = true
            } else {
                numberArray[numberArray.count - 1] = (numberArray.last ?? "") + button.btn.rawValue
            }
        case .Divide, .Multiply, .Plus:
            if !numberArray.isEmpty, isLastNumber {
                numberArray.append(button.btn.rawValue)
                isLastNumber = false
            }   else if numberArray.isEmpty {
                numberArray.append("0")
                numberArray.append(button.btn.rawValue)
                isLastNumber = false
            } else {
                numberArray.removeLast()
                numberArray.append(button.btn.rawValue)
                isLastNumber = false
            }
        case .Minus:
            if numberArray.isEmpty || !isLastNumber {
                numberArray.append(button.btn.rawValue)
                isLastNumber = true
            } else if !numberArray.isEmpty, let operators = numberArray.last, operators != "-" {
                numberArray.append(button.btn.rawValue)
                isLastNumber = false
            }
        case .Clear:
            //mainView.culcLabel.text = "0"
            //mainView.historyLabel.text = ""
            numberArray.removeAll()
            text = ""
            isLastNumber = false
        case .Equal:
            if !isLastNumber, !numberArray.isEmpty {
                numberArray.removeLast()
            }
            text = calc(expression: numberArray)
            historyArray.append(numberArray)
            numberArray.removeAll()
            numberArray.append(text)
            isLastNumber = true
            
        case .PlusMinus:
            if isLastNumber {
                let number = (Double(numberArray.last ?? "0") ?? 0) * -1
                numberArray[numberArray.count - 1] = round(number)
                text = numberArray.joined()
            }
        case .Percent:
            if isLastNumber {
                let number = (Double(numberArray.last ?? "0") ?? 0) / 100
                numberArray[numberArray.count - 1] = round(number)
                text = numberArray.joined()
            }
        case .Culc:
            break
        }
        text = numberArray.joined()
    }
    //MARK: -Separate number with operators
    private func numberSeparateOperators(_ expression: [String]) -> (numbers: [Double], operators: [String]) {
        var numbers = [Double]()
        var operators = [String]()
        
        for element in expression {
            if let number = Double(element) {
                numbers.append(number)
            } else if ["+", "-", "x", "/"].contains(element) {
                operators.append(element)
            }
        }
        return (numbers, operators)
    }
    //MARK: -Round result func
    private func round(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } else if number.truncatingRemainder(dividingBy: 0.001) != 0 {
            return String(format: "%.3f",number)
        } else {
            return String(number)
        }
    }
}
