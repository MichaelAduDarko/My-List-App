//
//  CheckBox.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 11/5/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    override init(frame: CGRect){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
