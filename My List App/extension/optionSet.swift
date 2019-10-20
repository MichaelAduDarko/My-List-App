//
//  optionSet.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/19/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import Foundation

struct ButtonOptions: OptionSet {
    let rawValue: Int
    
    static let roundedText   = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon  = ButtonOptions(rawValue: 1 << 1)
  
}
