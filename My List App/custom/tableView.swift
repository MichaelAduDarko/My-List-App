//
//  tableView.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 11/1/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class TableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        checkIfAutoLayOut()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
