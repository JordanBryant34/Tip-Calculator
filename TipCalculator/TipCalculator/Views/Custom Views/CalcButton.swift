//
//  CalcButton.swift
//  TipCalculator
//
//  Created by Jordan Bryant on 10/12/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

import UIKit

class CalcButton: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
            
        tintColor = .clear
        
        backgroundColor = .secondaryBlue()
        setTitleColor(.white, for: .selected)
        setTitleColor(.primaryBlue(), for: .normal)
    }
    
    func toggleButton(selected: Bool) {
        isSelected = selected
        
        if isSelected {
            backgroundColor = .primaryBlue()
        } else {
            backgroundColor = .secondaryBlue()
        }
    }
}
