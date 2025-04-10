//
//  ViewController.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 7.04.25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
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
        mainView.columnOne.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnTwo.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnThree.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.columnFour.elements.forEach { $0.addTarget(self, action: #selector(tapButton), for: .touchUpInside) }
        mainView.listButton.addTarget(self, action: #selector(tapButtonHistory), for: .touchUpInside)
        mainView.historyLabel.addGestureRecognizer(tapGesture)
    }
    
    
    @objc private func tapLabelHistory(_ sender: CustomButton) {
        guard let reLoad = logic.historyArray.last else { return }
        logic.numberArray = reLoad
        mainView.calcLabel.text = reLoad.joined()
        logic.historyArray.removeLast()
        logic.text = ""
        mainView.historyLabel.text?.removeAll()
    }
    
    @objc private func tapButtonHistory(_ sender: CustomButton) {
        let controller = HistoryViewController()
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
        print(logic.historyArray)
        
        if logic.text.isEmpty {
            mainView.calcLabel.text = "0"
            mainView.historyLabel.text = ""
        } else {
            mainView.calcLabel.text = logic.text
            mainView.historyLabel.text = logic.historyArray.last?.joined() ?? ""
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
