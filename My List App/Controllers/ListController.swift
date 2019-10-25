//
//  ListController.swift
//  My List App
//
//  Created by MICHAEL ADU DARKO on 10/18/19.
//  Copyright © 2019 Bronzy. All rights reserved.
//

import UIKit

class ListController: UIViewController, headerDelegate {
    func addItem() {
        print("add item")
    }
    
    
    let header = AppHeaderView(title: "Stuff to get done", subtitle: "4 left")
    let popUp = NewItemPopUp()
    
    var keyboardHeight: CGFloat = 0

    
    //Retrieving keyboard
    override func viewDidAppear(_ animated: Bool) {
       
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
       
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as!
        NSValue).cgRectValue.size
        
       self.keyboardHeight = keyboardSize.height
        
       
        //animation to bring up text feild
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.popUp.transform = CGAffineTransform(translationX: 0, y: -self.keyboardHeight)
        }, completion: nil  )
        
        
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
    
        view.addSubview(header)
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true

        view.addSubview(popUp)
        popUp.translatesAutoresizingMaskIntoConstraints = false
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -20).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 80).isActive = true

        
        header.delegate = self
    }
}

