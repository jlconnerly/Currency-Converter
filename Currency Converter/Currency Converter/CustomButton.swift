//
//  CustomButton.swift
//  Currency Converter
//
//  Created by Jake Connerly on 7/10/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
    }
    
    func styleButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        backgroundColor = .darkGray
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
