//
//  HistoryView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 9.04.25.
//

import UIKit

class HistoryView: UIView {
    
    lazy var collectionView = HistoryTableView()
    
    let readyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Готово", for: .normal)
        button.setTitleColor(.orangeButton, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .grayBackground
        addSubview(readyButton)
        addSubview(collectionView)
        collectionView.backgroundColor = .grayBackground
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            readyButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            readyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: readyButton.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
        ])
    }
}
