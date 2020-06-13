//
//  LFItem.swift
//  HotchStudentHiFi
//
//  Created by Roger Wistar on 6/13/20.
//  Copyright © 2020 Roger P Wistar. All rights reserved.
//

import Foundation

struct LFItem {
    var LFid : Int
    var LFisFound : Bool
    var LFdate : Date
    var LFemail : String
    var LFcontact : String
    var LFitemName : String
    var LFitemDesc : String
    
    var formattedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, YYYY"
        return dateFormatter.string(from: LFdate)
    }
}
