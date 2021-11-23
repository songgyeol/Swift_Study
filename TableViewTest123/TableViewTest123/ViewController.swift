//
//  ViewController.swift
//  TableViewTest123
//
//  Created by 송결 on 2021/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell

        cell.mainMenu.image = user[indexPath.row].mainMenu
        cell.name.text = user[indexPath.row].name
        
        return cell
    }
    
    
    let table = UITableView()
   // let testArray = ["a", "b", "c", "d", "e", "f","g", "h", "i"]
    
    let user: [User] = [User(mainMenu: UIImage(named: "슈퍼시드")!, name: "슈퍼시드"),
                        User(mainMenu: UIImage(named: "프리미엄")!, name: "프리미엄"),
                        User(mainMenu: UIImage(named: "클래식")!, name: "클래식"),
                        User(mainMenu: UIImage(named: "사이드디시")!, name: "사이드디시"),
                        User(mainMenu: UIImage(named: "음료")!, name: "음료"),
                        User(mainMenu: UIImage(named: "피클소스")!, name: "피클소스")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        layout()
        
        func layout() {
            view.addSubview(table)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            
            
        }
        
        func attribute() {
            table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
            table.delegate = self
            table.dataSource = self
            table.register(UITableViewCell.self, forCellReuseIdentifier: CustomCell.cellId)
        }
        
       // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         //   return testArray.count
        }
//            tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
//            tableView.delegate = self
//            tableView.dataSource = self
        }
        
        
  //  }




