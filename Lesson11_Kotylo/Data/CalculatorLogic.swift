//
//  CalculatorLogic.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 10.04.25.
//

import Foundation

class CalculatorLogic {
    
    func culc (expression: [String]) -> String {
        guard !expression.isEmpty else { return "0" }
        
        let numbers = numberSeparateOperators(expression).numbers
        let operators = numberSeparateOperators(expression).operators
        
        // Проверка на корректность выражения
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
                    return "Ошибка: деление на ноль"
                }
                result /= nextNumber
            default:
                return "Ошибка: неизвестный оператор"
            }
        }
        return round(result)
    }
    
    func numberSeparateOperators(_ expression: [String]) -> (numbers: [Double], operators: [String]) {
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
    
    func round(_ number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", number)
        } else if number.truncatingRemainder(dividingBy: 0.001) != 0 {
            return String(format: "%.3f",number)
        } else {
            return String(number)
        }
    }
}
