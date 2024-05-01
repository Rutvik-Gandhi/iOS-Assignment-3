//
//  secondViewController.swift
//  rutvik_ricky_assignment-2
//
//  Created by user212565 on 9/30/22.
//

import UIKit

class secondViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var table_view: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tab = tabBarController as! detailsBarController
        
        return tab.source_Array.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_value",for:indexPath)
        let tab = tabBarController as! detailsBarController
        cell.textLabel?.text = "\(tab.source_Array[indexPath.item])                          \(tab.destination_Array[indexPath.item])"
        return cell
        
        
    }
    
    //Delete function
    //Swipe left on a data in order to delete a row.
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let tab = tabBarController as! detailsBarController
        tableView.beginUpdates()
        tab.source_Array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}

