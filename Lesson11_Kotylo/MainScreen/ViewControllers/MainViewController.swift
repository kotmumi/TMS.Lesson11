//
//  ViewController.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 7.04.25.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    private let logic = CalculatorLogic()
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLabelHistory))
        mainView.columnOne.elements.forEach {
            if $0.btn == .Culc {
                $0.addTarget(self, action: #selector(tapSetting), for: .touchUpInside)
            }
            $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        }
        mainView.columnTwo.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnThree.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnFour.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.listButton.addTarget(self, action: #selector(tapButtonHistory), for: .touchUpInside)
        mainView.historyLabel.addGestureRecognizer(tapGesture)
        mainView.settingView.settingButton.addTarget(self, action: #selector(tapSetting), for: .touchUpInside)
        mainView.settingView.settingTextField.delegate = self
        
    }
    
    @objc private func tapSetting(_ sender: CustomButton) {
        switch sender.btn  {
        case .Culc:
            mainView.settingView.isHidden.toggle()
        default :
            mainView.historyLabel.text = mainView.settingView.settingTextField.text
            mainView.culcLabel.text = "Thanks)"
            mainView.settingView.isHidden.toggle()
        }
        
    }
    
    @objc private func tapLabelHistory(_ sender: CustomButton) {
        mainView.culcLabel.text = logic.getHistoryExpression()[logic.getHistoryExpression().count - 2].joined()
        mainView.historyLabel.text?.removeAll()
    }
    
    @objc private func tapButtonHistory(_ sender: CustomButton) {
        //MARK: -Lesson12 сallBack
        let controller = HistoryViewController {
            guard let expression = $0 else { return }
            self.logic.setExpression(expression, newExpression: true)
            self.mainView.historyLabel.text = ""
            self.mainView.culcLabel.text = self.logic.getExpression().joined()
        }
        //MARK: -Lesson12 Delegate
        controller.delegate = self
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 8
        }
        present(controller, animated: true)
    }
    
     @objc private func tapButton(_ sender: CustomButton) {
        animateButtonPress(sender)
        logic.add(button: sender)
         print("History Expression: \(logic.getHistoryExpression())")
         print("Result Expression: \(logic.getResultExpression())")
         print("Last Expression: \(logic.getExpression())")
        
         if logic.getExpression().isEmpty {
            mainView.culcLabel.text = "0"
            mainView.historyLabel.text = ""
        } else {
            mainView.culcLabel.text = logic.getExpression().joined()
            if !logic.getResultExpression().isEmpty, sender.btn == .Equal {
                mainView.historyLabel.text = logic.getHistoryExpression()[logic.getHistoryExpression().count - 2].joined()
            }
        }
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

//MARK: -Lesson12 Delegate
extension MainViewController: HistoryViewControllerDelegate {
    
    func getResultArray() -> [String] {
        logic.getResultExpression()
    }
    
    func getExpression() -> [[String]] {
        logic.getHistoryExpression()
    }
    
    func setExpression(_ expression: [String]) {
        logic.deleteLastExpression()
        logic.setExpression(expression, newExpression: true)
        mainView.culcLabel.text = logic.getHistoryExpression().last?.joined()
        mainView.historyLabel.text?.removeAll()
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

