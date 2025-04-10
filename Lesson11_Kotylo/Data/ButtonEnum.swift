//
//  DataStruct.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//
import Foundation
import UIKit

enum ButtonEnum: String, CaseIterable {
    case One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9", Zero = "0"
    case Clear = "AC"
    case Equal = "="
    case Plus = "+"
    case Minus = "-"
    case Multiply = "x"
    case Divide = "/"
    case Percent = "%"
    case Point =  "."
    case PlusMinus = "+-"
    case Culc = "calc"
    
    func getColor() -> UIColor {
        switch self {
        case .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Zero, .Point, .Culc: return .blackButton
        case .Clear, .Percent, .PlusMinus: return .grayButton
        case .Divide, .Multiply, .Minus, .Plus, .Equal: return .orangeButton
        }
    }
    func isNumber() -> Bool {
        switch self {
        case .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Zero, .Point: return true
        case .Clear, .Percent, .PlusMinus, .Divide, .Multiply, .Minus, .Plus, .Equal, .Culc: return false
        }
    }
    func isOperation() -> Bool {
        switch self {
        case .Divide, .Multiply, .Minus, .Plus, .Equal: return true
        case .Clear, .Percent, .PlusMinus, .One, .Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Zero, .Point, .Culc: return false
        }
    }
    func getImage() -> UIImage? {
        switch self {
        case .Divide: return UIImage(named: "div")
        default: return UIImage(named: self.rawValue)
        }
        
    }
    
}

