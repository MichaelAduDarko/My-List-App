        //
        //  ListController.swift
        //  My List App
        //
        //  Created by MICHAEL ADU DARKO on 10/18/19.
        //  Copyright © 2019 Bronzy. All rights reserved.
        //

            import UIKit

class ListController: UIViewController, headerDelegate, NewItemDelegate {
    
    var popUpLocation: CGFloat = 70
    
       func openAddItemPopup() {
        popUp.animatePopUp()
    }
    
                        func addItemToList(text:String) {
                            print("Text in textfield is : \(text)")
                        }
    
                            let header = AppHeaderView(title: "Stuff to get done", subtitle: "4 left")
                            let popUp = NewItemPopUp()
    
                            let bg:UIView = {
                                let view = MyListAppGradient()
                                view.layer.cornerRadius = 16
                                view.translatesAutoresizingMaskIntoConstraints = false
                                return view
                            }()
      let lisTable = TableView()
      let CELL_ID = "cell_id"
    
    
    var listData : [ToDo] = [ToDo]()
    
    
                var keyboardHeight: CGFloat = 345

                
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
                        
                    }
    
    
    func updateItemsLeft(){
        header.itemsLeft = 0
        self.listData.forEach { (toDo) in
            if !toDo.status{ header.itemsLeft += 1}
        }
    }

     
            override func viewDidLoad() {
                super.viewDidLoad()
                
                
                listData=[
                      ToDo(id: 0, title: "first item", status: false),
                      ToDo(id: 1, title: "second item", status: true),
                      ToDo(id: 2, title: "third item", status: true),
                   
                ]
                
                self.updateItemsLeft()
                view.backgroundColor = .white
                
           
                    view.addSubview(header)
                    header.translatesAutoresizingMaskIntoConstraints = false
                    header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                    header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                    header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
                    header.heightAnchor.constraint(equalToConstant: 120).isActive = true
                
                view.addSubview(bg)
                bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
                bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
                bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
                bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
                
                view.addSubview(lisTable)
                lisTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: 16).isActive = true
                lisTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: 16).isActive = true
                lisTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -16).isActive = true
                lisTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -16).isActive = true
                
                

                    view.addSubview(popUp)
                    popUp.translatesAutoresizingMaskIntoConstraints = false
                    popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                    popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
                    popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -20).isActive = true
                    popUp.heightAnchor.constraint(equalToConstant: 80).isActive = true
                
                
                    openAddItemPopup()
                
                   popUp.textField.delegate = self
                    popUp.delegate = self
                    header.delegate = self
                
                lisTable.delegate = self
                lisTable.dataSource = self
                lisTable.register(TableListCell.self, forCellReuseIdentifier: CELL_ID )
            }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
            
        }


            extension ListController: UITextFieldDelegate{
                
               
                func textFieldDidBeginEditing(_ textField: UITextField) {
                    popUp.animateView( transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
                }
                
                func textFieldDidEndEditing(_ textField: UITextField) {
                    popUp.animateView( transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
                }
            }

        
        extension ListController: UITableViewDelegate, UITableViewDataSource, ListCellDelegate{
            
            func toggleToDo(toDo updatedTodo: ToDo) {
                
                let newListData = self.listData.map { (oldToDo) -> ToDo in
                    if oldToDo.id == updatedTodo.id  {
                        var newToDo = oldToDo
                        newToDo.status = updatedTodo.status
                        newToDo.title = updatedTodo.title
                        return newToDo
                    }
                    
                    return oldToDo
                }
                
                self.listData = newListData
                self.lisTable.reloadData()
                self.updateItemsLeft()
            }
            
            
            func numberOfSections(in tableView: UITableView) -> Int {
                return 2
            }
            
            func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                if section == 0 {
                    return "Not Completed"
                }
                return "Completed"
                
                
            }
            
            func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                let titleForHeader = MyListAppLabel(color: .white, size: 22, frame:(CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44)))
                if section == 0 {
                    titleForHeader.text = "Not Completed"
                } else{
                    
                    titleForHeader.text = "Completed"
                }
                return titleForHeader
            }
            
            
            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 40
            }
            
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               
                
                var count = 0
                
                self.listData.forEach { (toDo) in
                    if section == 0 && !toDo.status{
                        count += 1
                    }else if (section == 1 && toDo.status){
                        count += 1
                    }
                    
                }
                return count
                
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)as! TableListCell

              cell.delegate = self
                var  itemsForSection:[ToDo] = []
                
                self.listData.forEach { (toDo) in
                    
                    if indexPath.section == 0 && !toDo.status{
                       itemsForSection.append(toDo)
                    }else if (indexPath.section == 1 && toDo.status){
                        itemsForSection.append(toDo)
                    }
                }
                
                  cell.toDo = itemsForSection[indexPath.row]
                return cell
                
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 42
            }
            
           
        }
