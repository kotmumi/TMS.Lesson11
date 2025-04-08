//
//  MainView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class MainView: UIView {
    
    let culcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "0"
        label.font = .systemFont(ofSize: 80, weight: .regular)
        return label
    }()
    
    let buttonContainer = ButtonContainerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        addSubview(buttonContainer)
        addSubview(culcLabel)
        
        buttonContainer.buttonPlus.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            buttonContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            buttonContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            culcLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            culcLabel.bottomAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: -16),
        ])
    }
    
    @objc func tapButton() {
        print("Tap")
    }
    
}

