//
//  ViewController.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/17/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bg:UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
    }


}

