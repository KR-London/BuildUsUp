//
//  JobTableViewController.swift
//  Build Us Up
//
//  Created by Kate Roberts on 17/11/2018.
//  Copyright © 2018 Kate Roberts. All rights reserved.
//

import UIKit

class JobTableViewController: UITableViewController {

//    Management    “000000000110”    D
//    Financial Technology    “000000110000”    A
//    Cyber Security    “000001001000”    S
//    Data Analysis    “000110000000”    A
//    Games Development    “011000000001”    E
//    UX/UI    “000000000011”    D
//    Quality Assurance    “111101010010”    S
//    Digital Marketing    “00000000100”    D
//    Front End    “100000000000”    E
//    Back End    “010100000000”    D
//    Technical    “111100010010”    S
//    Wordpress    “111100010010”    A
    
    let jobCodex = [
           [ "Management" ,   [0,0,0,0,0,0,0,0,0,1,1,0]   , "D"],
           [ "Financial Technology"  ,  [0,0,0,0,0,0,1,1,0,0,0,0]  , "A"],
           [ "Cyber Security" ,   [0,0,0,0,0,1,0,0,1,0,0,0]  ,  "S"],
           [ "Data Analysis"  ,  [0,0,0,1,1,0,0,0,0,0,0,0]   , "A"],
           [ "Games Development"   , [0,1,1,0,0,0,0,0,0,0,0,1]   , "E"],
           [ "UX/UI"   , [0,0,0,0,0,0,0,0,0,0,1,1]  ,  "D"],
           [ "Quality Assurance" ,   [1,1,1,1,0,1,0,1,0,0,1,0]  ,  "S"],
           [ "Digital Marketing"  ,  [0,0,0,0,0,0,0,0,1,0,0]  ,  "D"],
           [ "Front End"  ,  [1,0,0,0,0,0,0,0,0,0,0,0]  ,  "E"],
           [ "Back End"  ,  [0,1,0,1,0,0,0,0,0,0,0,0]   , "D"],
           [ "Technical"  ,  [1,1,1,1,0,0,0,1,0,0,1,0] ,   "S"],
            ["Wordpress"  ,  [1,1,1,1,0,0,0,1,0,0,1,0]   , "A" ],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
