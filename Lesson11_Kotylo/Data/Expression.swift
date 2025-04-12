//
//  Expression.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 12.04.25.
//

struct Expression {
    var historyExpression: [[String]] = []
    var historyResult: [String] = []
    var lastExpression: [String] { historyExpression.last ?? [] }
}
