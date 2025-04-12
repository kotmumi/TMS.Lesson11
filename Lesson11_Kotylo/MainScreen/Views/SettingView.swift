//
//  SettingView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 10.04.25.
//

import UIKit

class SettingView: UIView {
    
    let settingTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Rate my homework)"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return textField
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orangeButton
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
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
    
     private func setupViews() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
         layer.cornerRadius = 24
         backgroundColor = .blackButton
         addSubview(settingTextField)
         addSubview(settingButton)

    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            settingTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32),
            settingTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            settingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingButton.topAnchor.constraint(equalTo: settingTextField.bottomAnchor, constant: 32),
            settingButton.widthAnchor.constraint(equalTo: settingTextField.widthAnchor)
        ])
    }
}
