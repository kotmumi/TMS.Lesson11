//
//  ButtonContainerView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class ButtonContainerView: UIView {
    
    let buttonPlus = CustomButton(title: "+", backgroundColor: .orangeButton)
    let buttonMinus = CustomButton(title: "-", backgroundColor: .orangeButton)
    let buttonDivide = CustomButton(title: "/", backgroundColor: .orangeButton)
    let buttonMultiply = CustomButton(title: "Х", backgroundColor: .orangeButton)
    let buttonEquals = CustomButton(title: "=", backgroundColor: .orangeButton)
    
    let buttonPercent = CustomButton(title: "%", backgroundColor: .grayButton)
    let button9 = CustomButton(title: "9", backgroundColor: .blackButton)
    let button6 = CustomButton(title: "6", backgroundColor: .blackButton)
    let button3 = CustomButton(title: "3", backgroundColor: .blackButton)
    let buttonPoint = CustomButton(title: ".", backgroundColor: .blackButton)
    
    let buttonPlusMinus = CustomButton(title: "+/-", backgroundColor: .grayButton)
    let button8 = CustomButton(title: "8", backgroundColor: .blackButton)
    let button5 = CustomButton(title: "5", backgroundColor: .blackButton)
    let button2 = CustomButton(title: "2", backgroundColor: .blackButton)
    let button0 = CustomButton(title: "0", backgroundColor: .blackButton)
    
    let buttonReturn = CustomButton(title: "<-", backgroundColor: .grayButton)
    let button7 = CustomButton(title: "7", backgroundColor: .blackButton)
    let button4 = CustomButton(title: "4", backgroundColor: .blackButton)
    let button1 = CustomButton(title: "1", backgroundColor: .blackButton)
    let buttonCulc = CustomButton(title: "culc", backgroundColor: .blackButton)
    
    let stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    let stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    let stackViewVertical2: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    let stackViewVertical3: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    let stackViewVertical4: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
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
        addSubview(stackViewHorizontal)
        addSubview(stackViewVertical)
        addSubview(stackViewVertical2)
        addSubview(stackViewVertical3)
        addSubview(stackViewVertical4)
        
        stackViewVertical.addArrangedSubview(buttonDivide)
        stackViewVertical.addArrangedSubview(buttonMultiply)
        stackViewVertical.addArrangedSubview(buttonMinus)
        stackViewVertical.addArrangedSubview(buttonPlus)
        stackViewVertical.addArrangedSubview(buttonEquals)
        
        stackViewVertical2.addArrangedSubview(buttonPercent)
        stackViewVertical2.addArrangedSubview(button9)
        stackViewVertical2.addArrangedSubview(button6)
        stackViewVertical2.addArrangedSubview(button3)
        stackViewVertical2.addArrangedSubview(buttonPoint)
        
        stackViewVertical3.addArrangedSubview(buttonPlusMinus)
        stackViewVertical3.addArrangedSubview(button8)
        stackViewVertical3.addArrangedSubview(button5)
        stackViewVertical3.addArrangedSubview(button2)
        stackViewVertical3.addArrangedSubview(button0)
        
        stackViewVertical4.addArrangedSubview(buttonReturn)
        stackViewVertical4.addArrangedSubview(button7)
        stackViewVertical4.addArrangedSubview(button4)
        stackViewVertical4.addArrangedSubview(button1)
        stackViewVertical4.addArrangedSubview(buttonCulc)
        
        stackViewHorizontal.addArrangedSubview(stackViewVertical4)
        stackViewHorizontal.addArrangedSubview(stackViewVertical3)
        stackViewHorizontal.addArrangedSubview(stackViewVertical2)
        stackViewHorizontal.addArrangedSubview(stackViewVertical)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            stackViewHorizontal.topAnchor.constraint(equalTo: topAnchor),
            stackViewHorizontal.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }
}

