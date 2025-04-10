//
//  CustomButton.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 8.04.25.
//

import UIKit

class CustomButton: UIButton {
    
    let btn: ButtonEnum
    let isNumber: Bool
    let isOperation: Bool
    var image: UIImage? = nil
    
    init (_ button: ButtonEnum) {
        self.btn = button
        isNumber = button.isNumber()
        isOperation = button.isOperation()
        super.init(frame: .zero)
        image = button.getImage()
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(btn.rawValue, for: .normal)
        backgroundColor = btn.getColor()
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "Helvetica", size: 32)
        if let img = image {
            setTitle("", for: .normal)
            setImage(img, for: .normal)
        }
        layer.cornerRadius = 42
        widthAnchor.constraint(equalToConstant: 84).isActive = true
        heightAnchor.constraint(equalToConstant: 84).isActive = true
    }
}

