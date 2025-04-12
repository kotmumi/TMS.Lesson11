//
//  HistoryViewController.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

//MARK: -Lesson12 Delegate
protocol HistoryViewControllerDelegate {

    func getExpression() -> [[String]]
    func getResultArray() -> [String]
    func setExpression(_ expression: [String])
}

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()
    
    //MARK: -Lesson12
    var delegate: HistoryViewControllerDelegate?
    var callback: ([String]?) -> Void
    
    init(callback: @escaping ([String]?) -> Void) {
        self.callback = callback
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        historyView.readyButton.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
        //MARK: -Lesson12 Delegate
        historyView.collectionView.delegateSecond = self
        historyView.collectionView.expressionArray = delegate?.getExpression() ?? []
        historyView.collectionView.resultArray = delegate?.getResultArray() ?? []
        historyView.collectionView.reloadData()
        
    }
    
    @objc func tapBtn() {
        dismiss(animated: true)
    }
}

extension HistoryViewController: HistoryCellDelegate {
    func TapCell(_ expression: [String]) {
        delegate?.setExpression(expression)
        dismiss(animated: true)
    }
}
