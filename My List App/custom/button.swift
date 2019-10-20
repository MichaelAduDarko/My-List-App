//
//  button.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/18/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit
class button: UIButton {
    
    var title: String!
    
    init(tittle: String = "button text", frame: CGRect = .zero) {
        super.init(frame: frame)
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = tittle
         self.buttonComponents()
    }
    
    
    func buttonComponents() {
       
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.layer.cornerRadius = 20
        self.backgroundColor = .white
        if self.titleLabel != nil{
            titleLabel?.font = UIFont.init(name: "AbhayaLibre-Bold", size: 16)
        }
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

