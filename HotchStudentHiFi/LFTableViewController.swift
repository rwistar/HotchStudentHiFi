//
//  LFTableViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger Wistar on 6/13/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit

var LFItems = [LFItem]()

var myUserID = "rwistar@hotchkiss.org"
var myUserName = "Roger Wistar"

class LFTableCell : UITableViewCell {
    @IBOutlet weak var lblLFItemName: UILabel!
    @IBOutlet weak var lblLFDate: UILabel!
    @IBOutlet weak var lblLFContact: UILabel!
    
}

class LFTableViewController: UITableViewController {

    var selectedItem : LFItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let date1 = formatter.date(from: "2020/04/02 12:15")
        LFItems.append(LFItem(LFid: 1, LFisFound: false, LFdate: date1!, LFemail: "rwistar@hotchkiss.org", LFcontact: "Roger Wistar", LFitemName: "RFTG game", LFitemDesc: "I've lost my copy of Race for The Galaxy. Please help me find it!"))

        let date2 = formatter.date(from: "2020/04/02 13:30")
        LFItems.append(LFItem(LFid: 2, LFisFound: false, LFdate: date2!, LFemail: "mwistar@hotchkiss.org", LFcontact: "Marcie Wistar", LFitemName: "Nintendo Switch", LFitemDesc: "We can't find the Nintendo Switch that was in the activities closet. Any idea where it is now?"))

        let date3 = formatter.date(from: "2020/04/01 9:30")
        LFItems.append(LFItem(LFid: 3, LFisFound: false, LFdate: date3!, LFemail: "bwistar26@hotchkiss.org", LFcontact: "Benjamin Wistar", LFitemName: "Golf clubs", LFitemDesc: "I left my golf clubs out in the front yard and now they're gone. Please help me find them!"))

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return LFItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellLF", for: indexPath) as! LFTableCell

        // Configure the cell...
        let idx = indexPath.row
        let item = LFItems[idx]
        
        let itemNameStr = "#\(item.LFid): \(item.LFitemName)"
        cell.lblLFItemName.text = itemNameStr
        
        cell.lblLFDate.text = item.formattedDate
        
        cell.lblLFContact.text = item.LFcontact

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = LFItems[indexPath.row]
        performSegue(withIdentifier: "segueLF", sender: self)
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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let foundIt = UITableViewRowAction(style: .normal, title: "Found it!") { (action, indexPath) in
            print("Found it!")
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
            
            let item = LFItems[itemIdx]
            let ownerEmail = item.LFemail
            
            let foundMesssage = "\(ownerEmail) has been contacted to set up an item return"
            let alert = UIAlertController(title: "Good work!", message: foundMesssage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                
               //validation logic goes here
            }
            
            //add button to alert
            alert.addAction(OKAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        foundIt.backgroundColor = UIColor.blue

        return [foundIt]
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "segueLF" {
            if let destination = segue.destination as? LFDetailViewController {
                destination.item = selectedItem
            }
        }
    }
    

}
