//
//  Cell.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var expressionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2+3"
        label.textAlignment = .left
        label.textColor = .grayButton
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

        backgroundColor = .grayBackground
        addSubview(expressionLabel)
        addSubview(resultLabel)

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            expressionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            expressionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            expressionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            resultLabel.topAnchor.constraint(equalTo: expressionLabel.bottomAnchor, constant: 2),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            resultLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

        ])
    }
    
    override func prepareForReuse() {
        expressionLabel.text = ""
        resultLabel.text = ""
    }
}
