//
//  HistoryViewController.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()
    
    override func loadView() {
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        historyView.readyButton.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
    }
    
    @objc func tapBtn() {
        dismiss(animated: true)
    }
}
