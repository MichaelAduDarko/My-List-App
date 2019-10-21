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
    var type : ButtonOptions!
    var radius: CGFloat!
    
    
    
    init(tittle: String = "button text", frame: CGRect = .zero, type:ButtonOptions = .roundedText, radius: CGFloat = 20) {
        super.init(frame: frame)
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
         self.title = tittle
       self.type = type
        self.radius = radius
       self.phaseTwo()
    }
    
    func phaseTwo(){
        self.setTitleColor(.grayZero, for: .normal)
        self.backgroundColor = .white
        self.setTitle(self.title, for: .normal)
        if self.titleLabel != nil{
            titleLabel?.font = UIFont.init(name: "AbhayaLibre-Bold", size: 16)
        }
        
        switch type {
        case .roundedText?:
            self.roundedText()
        case .squareIcon?:
            self.squareIcon()
        default: break;
            
        }
    }
    
    
    func squareIcon(){
        //this is where we will set our custom icons
        if self.titleLabel != nil{
            titleLabel?.font = UIFont.init(name: "AbhayaLibre-Bold", size: 24)
        }
        
    }
    
   
    
    
            func roundedText() {
                self.layer.cornerRadius = self.radius
              
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

