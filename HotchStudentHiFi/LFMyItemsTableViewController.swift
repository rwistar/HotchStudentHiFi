//
//  LFMyItemsTableViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 6/14/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit

class LFMyItemsTableViewController: UITableViewController {
    
    var selectedItem : LFItem?
    
    var myItems = [LFItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        getMyItems()
        tableView.reloadData()
    }
    
    func getMyItems() {
        myItems = [LFItem]()
        
        for item in LFItems {
            if myUserID == item.LFemail {
                myItems.append(item)
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLF", for: indexPath) as! LFTableCell

        // Configure the cell...
        let idx = indexPath.row
        let item = myItems[idx]
        
        let itemNameStr = "#\(item.LFid): \(item.LFitemName)"
        cell.lblLFItemName.text = itemNameStr
        
        cell.lblLFDate.text = item.formattedDate
        
        cell.lblLFContact.text = item.LFcontact

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            let cell = tableView.cellForRow(at: indexPath) as! LFTableCell
            let itemName = cell.lblLFItemName.text!
            let idIdx = itemName.firstIndex(of: ":")!
            let start = itemName.index(itemName.startIndex, offsetBy: 1)
            let itemNum = Int(itemName[start..<idIdx])

            var itemIdx = 0
            for idx in 0..<LFItems.count {
                if LFItems[idx].LFid == itemNum {
                    itemIdx = idx
                }
            }
            LFItems.remove(at: itemIdx)
            
            getMyItems()
            tableView.reloadData()

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
