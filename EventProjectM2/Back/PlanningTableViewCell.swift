//
//  PlanningTableViewCell.swift
//  Event
//
//  Created by user232077 on 1/10/23.
//

import UIKit

class PlanningTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventEndHour: UILabel!
    
    @IBOutlet weak var eventStartHour: UILabel!
    
    @IBOutlet weak var eventActivity: UILabel!
    
    @IBOutlet weak var eventType: UILabel!
    
    private func updateUI(activity: String, typeActivity: String?, startHour: String, endHour: String) {
        self.eventActivity.text = activity
        self.eventType.text = typeActivity
        self.eventDate.text
    }
    
    func dateFormatter(_ date: String) {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ""
    }
}
