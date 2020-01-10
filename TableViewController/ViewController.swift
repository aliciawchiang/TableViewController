//
//  ViewController.swift
//  TableViewController
//
//  Created by mark me on 1/9/20.
//  Copyright © 2020 mark me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var names = ["Hello"]
    var pic = ["pic"]
    
    @IBOutlet var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addItem(_ sender: Any)
    {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Entry", message: "", preferredStyle: .alert)
        let actionAdd = UIAlertAction(title: "Add", style: .destructive, handler: {(action) in
            self.names.append(textField.text!)
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alert.addTextField { (alertTextField) in alertTextField.placeholder = "Add new Item"
            
            textField = alertTextField
        }
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.label?.text = names[indexPath.row]
        cell.picImage.image = UIImage(named: pic[indexPath.row])
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.clipsToBounds = true
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

