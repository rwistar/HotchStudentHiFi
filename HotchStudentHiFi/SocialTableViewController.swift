//
//  SocialTableViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 6/3/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit

var feeds = [String: String]()

class SocialTableViewController: UITableViewController {

    var feedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feeds["Twitter"] = "https://twitter.com/HotchkissSchool/"
        feeds["Instagram"] = "https://www.instagram.com/hotchkissschool/"
        feeds["Facebook"] = "https://www.facebook.com/TheHotchkissSchool/"
        feeds["Hotchkiss Sports"] = "https://twitter.com/HotchkissSports/"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSocial", for: indexPath)

        // Configure the cell...
        let idx = indexPath.row
        cell.textLabel?.text = feeds.keys.sorted()[idx]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath), let label = cell.textLabel, let name = label.text {
            feedName = name
        }
        
        performSegue(withIdentifier: "segueSocial", sender: self)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "segueSocial" {
            if let destination = segue.destination as? SocialViewController {
                destination.socialURL = feeds[feedName]
            }
        }
    }
    

}
