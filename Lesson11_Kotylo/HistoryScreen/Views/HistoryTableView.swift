//
//  CellCollectionView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

class HistoryTableView: UITableView {
    
    var expressionArray: [[String]] = []
    var resultArray: [String] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        register(HistoryCell.self, forCellReuseIdentifier: "cell")
        delegate = self
        dataSource = self
    }
}

extension HistoryTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expressionArray.count - 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryCell else {
            return UITableViewCell()
        }
        
        cell.expressionLabel.text = expressionArray[indexPath.row].joined()
        cell.resultLabel.text = resultArray[indexPath.row]
        return cell
    }
}
    
extension HistoryTableView: UITableViewDelegate {
    
}


