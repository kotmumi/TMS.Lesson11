//
//  CustomButton.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class CustomButton: UIButton {
    
    init (title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 40, weight: .light)
        layer.cornerRadius = 40
        widthAnchor.constraint(equalToConstant: 80).isActive = true
        heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    
}

