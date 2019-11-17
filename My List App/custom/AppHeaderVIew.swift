//
//  AppHeader.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/19/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class AppHeaderView: UIView {
    
    let bg =  MyListAppGradient()
    let myTitleLabel = MyListAppLabel(size: 18)
    let subTitleLabel = MyListAppLabel( size: 24)
    let addButton = button(  type: .squareIcon)
    var delegate: headerDelegate?
    
    
    init(frame: CGRect = .zero, title:String = "Stuff to get done", subtitle: String = "4 left " ) {
        super.init(frame: frame)
    if frame == .zero{
        translatesAutoresizingMaskIntoConstraints = false
    }
        self.myTitleLabel.text = title
        self.subTitleLabel.text = subtitle
        setupLayout()
      
}
    
    var itemsLeft : Int = 0{
        didSet{
            self.subTitleLabel.text = "\(itemsLeft) Left"
        }
    }
    
    
    
    
    func setupLayout(){
        addSubview(bg)
         bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
         bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
         bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
         bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(myTitleLabel)
        addSubview(subTitleLabel)
        
        myTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        myTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 8).isActive = true
        myTitleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        subTitleLabel.topAnchor.constraint(equalTo: myTitleLabel.bottomAnchor).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -50).isActive = true
        
        
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 16 - 14).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddbutton), for: .touchUpInside)
    }
    
    @objc func handleAddbutton(){
        if let delegate = self.delegate{
            delegate.openAddItemPopup()
        }
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

