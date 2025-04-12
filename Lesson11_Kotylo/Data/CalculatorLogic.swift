//
//  CalculatorLogic.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 10.04.25.
//

import Foundation

class CalculatorLogic {
    
    private var isLastNumber = false
    private var expression = Expression()
    
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
    
    //MARK: -add Expression Array
    func add(button: CustomButton) {
        var lastExpression = getExpression()
        switch button.btn {
        case .Zero, .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine:
            if isLastNumber, !lastExpression.isEmpty {
                guard var lastCharExpressiom = lastExpression.last else { return }
                lastCharExpressiom += button.btn.rawValue
            } else {
                lastExpression.append(button.btn.rawValue)
                isLastNumber = true
            }
        case .Point:
            if !isLastNumber || lastExpression.isEmpty {
                lastExpression.append("0.")
                isLastNumber = true
            } else {
                guard var lastCharExpressiom = lastExpression.last else { return }
                lastCharExpressiom += button.btn.rawValue
            }
        case .Divide, .Multiply, .Plus:
            if isLastNumber, !lastExpression.isEmpty {
                lastExpression.append(button.btn.rawValue)
                isLastNumber = false
            }   else if lastExpression.isEmpty {
                lastExpression.append("0")
                lastExpression.append(button.btn.rawValue)
                isLastNumber = false
            } else {
                lastExpression.removeLast()
                lastExpression.append(button.btn.rawValue)
                isLastNumber = false
            }
        case .Minus:
            if !isLastNumber || lastExpression.isEmpty {
                lastExpression.append(button.btn.rawValue)
                isLastNumber = true
            } else if !lastExpression.isEmpty, let operators = lastExpression.last, operators != "-" {
                lastExpression.append(button.btn.rawValue)
                isLastNumber = false
            }
        case .Clear:
            lastExpression.removeAll()
            isLastNumber = false
        case .Equal:
            if !isLastNumber,  !lastExpression.isEmpty {
                lastExpression.removeLast()
            }
            setResultExpression(calc(expression: lastExpression))
            setExpression([getResultExpression().last ?? ""], newExpression: true)
            isLastNumber = true
            return
            
        case .PlusMinus:
            if isLastNumber {
                let number = (Double(lastExpression.last ?? "0") ?? 0) * -1
                lastExpression[lastExpression.count - 1] = round(number)
            }
        case .Percent:
            if isLastNumber {
                let number = (Double(lastExpression.last ?? "0") ?? 0) / 100
                lastExpression[lastExpression.count - 1] = round(number)
            }
        case .Culc:
            break
        }
        setExpression(lastExpression, newExpression: false)
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
    
    func getExpression() -> [String] {
        return expression.lastExpression
    }
    
    func setExpression(_ expression: [String], newExpression: Bool) {
        if newExpression || self.expression.historyExpression.isEmpty {
            self.expression.historyExpression.append(expression)
        } else {
            self.expression.historyExpression[self.expression.historyExpression.count - 1] = expression
        }
    }
    
    func getHistoryExpression() -> [[String]] {
        expression.historyExpression
    }
    
    func getResultExpression() -> [String] {
        expression.historyResult
    }
    
    func setResultExpression(_ result: String) {
        expression.historyResult.append(result)
    }
    
    func getExpressionObject() -> Expression {
        expression
    }
    
    func deleteLastExpression() {
        expression.historyExpression.removeLast()
    }
}
