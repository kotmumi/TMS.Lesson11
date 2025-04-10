//
//  SettingView.swift
//  Lesson11_Kotylo
//
//  Created by Кирилл Котыло on 10.04.25.
//

import UIKit

class SettingView: UIView {
    
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

    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
