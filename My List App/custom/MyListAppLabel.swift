//
//  MyListAppLabel.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/17/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit


class MyListAppLabel: UILabel {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(title: String = "default text", color:UIColor = .white , size:CGFloat = 16, frame: CGRect = .zero, textAlign:  NSTextAlignment = .left) {
        super.init(frame: .zero)
        
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)
        self.textAlignment = textAlign
    }
}

