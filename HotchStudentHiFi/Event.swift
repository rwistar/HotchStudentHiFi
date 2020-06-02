//
//  Event.swift
//  HotchStudentHiFi
//
//  Created by Roger P Wistar on 6/1/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import Foundation

struct Event {
    var title: String
    var desc: String
    var date: Date
    var loc: String
    
    var formattedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, hh:mm a"
        return dateFormatter.string(from: date)
    }
}
