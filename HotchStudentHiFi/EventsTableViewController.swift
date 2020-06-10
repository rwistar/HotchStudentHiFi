//
//  EventsTableViewController.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 6/1/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import UIKit

var events = [Event]()

var filters = [String: Bool]()

class EventsTableCell: UITableViewCell {
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDate: UILabel!
    @IBOutlet weak var lblEventDesc: UILabel!
}

class EventsTableViewController: UITableViewController {

    var selectedEvent : Event?
    
    var filteredEvents = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let date1 = formatter.date(from: "2020/04/02 12:15")
        events.append(Event(title: "Chapel", desc: "", date: date1!, loc: "Zoom", org: "Student Activities", contact: "Jason Larson"))
        filters["Student Activities"] = true

        let date3 = formatter.date(from: "2020/04/03 15:00")
        events.append(Event(title: "Environmental impact of COVID-19", desc: "", date: date3!, loc: "Zoom", org: "SEA", contact: "SEA Board"))
        filters["SEA"] = true
        
        let date2 = formatter.date(from: "2020/04/02 13:30")
        events.append(Event(title: "BaHSA", desc: "We'll be discussing the effects of COVID-19 on food, education, healthcare systems and more for people of different demographics mainly within the United States.", date: date2!, loc: "Zoom", org: "BaHSA", contact: "BaHSA Board"))
        filters["BaHSA"] = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        filterEvents()
        tableView.reloadData()
    }
    
    func filterEvents() {
        filteredEvents = [Event]()
        
        for event in events {
            if filters[event.org] == true {
                filteredEvents.append(event)
            }
        }
        
        filteredEvents.sort {
            $0.date < $1.date
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredEvents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellEvent", for: indexPath) as! EventsTableCell

        // Configure the cell...

        let event = filteredEvents[indexPath.row]
        
        cell.lblEventTitle.text = event.title
        cell.lblEventDate.text = event.formattedDate
        cell.lblEventDesc.text = event.desc
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEvent = filteredEvents[indexPath.row]
        performSegue(withIdentifier: "segueEventDetail", sender: self)
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
        
        if segue.identifier == "segueEventDetail" {
            if let destination = segue.destination as? EventDetailViewController {
                destination.event = selectedEvent
            }            
        }
    }
    

}
