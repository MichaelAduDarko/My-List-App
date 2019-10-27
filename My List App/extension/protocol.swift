//
//  protocol.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/20/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import Foundation

protocol headerDelegate {
    func openAddItemPopup()
}

protocol NewItemDelegate{
    
    func addItemToList(text:String)
    
}
