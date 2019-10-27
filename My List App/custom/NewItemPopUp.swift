//
//  NewItemPopUp.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/20/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

    class NewItemPopUp: MyListAppGradient {
        
        let cancel = button(tittle: "  cancel  ",  type: .roundedText, radius: 4)
        let add = button(tittle: "  add  ", type: .roundedText, radius: 4)
        let textField = AppTextFiled(placeholder: "go buy Ikea frames", inset: 6)
        var delegate: NewItemDelegate?
        
        
        
        
       @objc func handleCancel(){
       textField.resignFirstResponder()
        }
        
        @objc func handleAdd(){
            if let delegate = self.delegate,  let textFieldText = self.textField.text {
                delegate.addItemToList(text: textFieldText)
            }
        }
        
        override init(frame: CGRect = .zero) {
            super.init(frame: frame)
            
            let insert:CGFloat = 12
            
            
            self.layer.cornerRadius = 14
            
            
            addSubview(cancel)
            cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: insert).isActive = true
            cancel.topAnchor.constraint(equalTo: topAnchor, constant: insert).isActive = true
            cancel.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            addSubview(add)
            add.rightAnchor.constraint(equalTo: rightAnchor, constant: insert * -1).isActive = true
            add.topAnchor.constraint(equalTo: topAnchor, constant: insert).isActive = true
            add.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            
            addSubview(textField)
            textField.leftAnchor.constraint(equalTo: leftAnchor, constant: insert).isActive = true
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: insert * -1).isActive = true
            textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 8).isActive = true
            textField.heightAnchor.constraint(equalToConstant: 28).isActive = true
            
            cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
            add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        }
        
    
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
