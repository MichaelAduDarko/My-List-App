//
//  TableCell.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 11/1/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class TableListCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        textLabel?.textColor = .grayZero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
