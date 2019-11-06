//
//  CheckBox.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 11/5/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    var toggled: Bool?{
        didSet{
            if let toggled = toggled {
                UIView.animate(withDuration: 0.2){
                    if toggled {
                        self.backgroundColor = .green
                       self.setImage(UIImage(named: "done-icon"), for: .normal)
                    } else{
                        self.backgroundColor = .clear
                        self.setImage(UIImage(), for: .normal)
                    }
                }
            }
            
        }
    }
    
    @objc func toggleStatus(){
        if let status = toggled{
            toggled = !status
        }
    }
    
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
        
        addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}