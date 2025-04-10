//
//  ViewController.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 7.04.25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private var numberArray = [String]()
    var historyArray = [[String]] ()
    private var historyNumberArray = [String]()
    private let mainView = MainView()
    private var isLastNumber = false
    private var text = ""
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLabelHistory))
        mainView.columnOne.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnTwo.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnThree.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnFour.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.listButton.addTarget(self, action: #selector(tapButtonHistory), for: .touchUpInside)
        mainView.historyLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapLabelHistory(_ sender: CustomButton) {
        guard let reload = historyArray.last else { return }
        numberArray = reload
        text = reload.joined()
        mainView.culcLabel.text = text
        print(numberArray)
        mainView.historyLabel.text = ""
    }
    
    @objc func tapButtonHistory(_ sender: CustomButton) {
        let controller = HistoryViewController()
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 8
        }
        present(controller, animated: true)
    }
    
    @objc func tapButton(_ sender: CustomButton) {
        animateButtonPress(sender)
        addNumArray(button: sender)
        mainView.culcLabel.text = text
        
        switch sender.btn {
        case .Clear:
            mainView.culcLabel.text = "0"
            mainView.historyLabel.text = ""
            numberArray.removeAll()
            text = ""
        case .Equal:
            mainView.historyLabel.text = text
            historyNumberArray = numberArray
            text = CalculatorLogic().culc(expression: numberArray)
            mainView.culcLabel.text = text
            historyArray.append(numberArray)
            numberArray.removeAll()
            numberArray.append(text)
            
        case .PlusMinus:
            if isLastNumber {
                let number = (Double(numberArray.last ?? "0") ?? 0) * -1
                numberArray[numberArray.count - 1] = CalculatorLogic().round(number)
                text = numberArray.joined()
                mainView.culcLabel.text = text
            }
        case .Percent:
            if isLastNumber {
                let number = (Double(numberArray.last ?? "0") ?? 0) / 100
                numberArray[numberArray.count - 1] = CalculatorLogic().round(number)
                text = numberArray.joined()
                mainView.culcLabel.text = text
            }
        case .Culc:
            mainView.settingView.isHidden.toggle()
        default :
            break
        }
        print(numberArray)
    }
}

extension ViewController {
    
    func addNumArray(button: CustomButton) {
        
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
        default:
            break
        }
        text = numberArray.joined()
    }
    
    private func animateButtonPress(_ button: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            button.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.alpha = 1.0
            }
        }
    }
}
