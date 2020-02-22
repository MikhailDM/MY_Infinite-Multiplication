//
//  AchieveTableViewController.swift
//  Multiplication Table
//
//  Created by Mike on 21.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class AchieveTableViewController: UITableViewController {
//MARK: - VARIABLES
    
    //let array = ["РЕШИТЬ ВСЕ ПРИМЕРЫ", "5 ТРЕНИРОВОК ПО ЧИСЛАМ", "1000 РЕШЕННЫЙ ПРИМЕРОВ"]
    

//MARK: - OBJECTS
    let achieves = AchievementsData()
    
    
//MARK: - LOADINGS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    //MARK: - UI SETUP
    
    func setupUI(){
        //Показ бара навигации
        navigationController?.isNavigationBarHidden = false
        //Регистрация кастомной ячейки
        tableView.register(UINib(nibName: K.Achieve.cellName, bundle: nil), forCellReuseIdentifier: K.Achieve.cellID)
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return achieves.arrayAch.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "achieveCell", for: indexPath) as! AchieveTableViewCell
        
        cell.descriptionLabel.text = achieves.arrayAch[indexPath.row].titleAch

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
