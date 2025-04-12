//
//  MainView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class MainView: UIView {
    
    let data = Data()
    
    let columnOne: VerticalStackView
    let columnTwo: VerticalStackView
    let columnThree: VerticalStackView
    let columnFour: VerticalStackView
    
    let settingView = SettingView()
    
    let historyLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .grayButton
        label.font = .systemFont(ofSize: 32, weight: .regular)
        return label
    }()
    
    let culcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "0"
        label.font = .systemFont(ofSize: 72, weight: .regular)
        return label
    }()
    
    let listButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "list"), for: .normal)
        return button
    }()
    
    let buttonHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        columnOne = VerticalStackView(data.columnOne)
        columnTwo = VerticalStackView(data.columnTwo)
        columnThree = VerticalStackView(data.columnThree)
        columnFour = VerticalStackView(data.columnFour)
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupViews() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
         
        addSubview(listButton)
        addSubview(culcLabel)
        addSubview(historyLabel)
        addSubview(buttonHorizontalStackView)
        addSubview(settingView)
        settingView.isHidden = true
         
        buttonHorizontalStackView.addArrangedSubview(columnOne)
        buttonHorizontalStackView.addArrangedSubview(columnTwo)
        buttonHorizontalStackView.addArrangedSubview(columnThree)
        buttonHorizontalStackView.addArrangedSubview(columnFour)

    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            listButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            listButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            listButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07),
            listButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07),
            
            buttonHorizontalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            buttonHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonHorizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            culcLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            culcLabel.bottomAnchor.constraint(equalTo: buttonHorizontalStackView.topAnchor, constant: -16),
            
            historyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            historyLabel.bottomAnchor.constraint(equalTo: culcLabel.topAnchor, constant: -8),
            
            settingView.bottomAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor),
            settingView.leadingAnchor.constraint(equalTo: buttonHorizontalStackView.leadingAnchor),
            settingView.heightAnchor.constraint(equalToConstant: 200),
            settingView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}

