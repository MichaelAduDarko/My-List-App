//
//  TableCell.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 11/1/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class TableListCell: UITableViewCell {
    
    let titleLabel = MyListAppLabel(color: .grayZero, size: 14)
    var toDo: ToDo?{
        didSet{
            if let toDo = toDo{
                print(toDo.status)
                self.titleLabel.text = toDo.title
            }
           
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
       backgroundColor = .clear
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.backgroundColor = .white
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
