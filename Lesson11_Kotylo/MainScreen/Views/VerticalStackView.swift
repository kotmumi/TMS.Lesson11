//
//  VerticalStack.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class VerticalStackView: UIStackView {
    
    let elements: [CustomButton]
    
    init(_ elements: [CustomButton]) {
        self.elements = elements
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillEqually
        alignment = .center
        spacing = 8
        elements.forEach { addArrangedSubview($0) }
    }
}

    
