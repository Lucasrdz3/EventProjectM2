//
//  ViewModelPlanning.swift
//  Event
//
//  Created by user232077 on 1/10/23.
//

import Foundation

class ViewModelPlanning {
    
    private var requestFactory = RequestFactory()
    private var AllEvents = [Planning]()
    
    func fetchPlanningEvents(completion: @escaping () -> ()) {
        requestFactory.getPlanningList { (errorHandle, events) in
            if let _ = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                print(errorMessage)
            }
            else if let list = events {
                self.AllEvents = list
                print("success")
            }
            else {
                print("Houston we got a problem")
            }
        }
    }
    
    func numberOfRowInSection(section: Int) -> Int {
        if AllEvents.count != 0 {
            return AllEvents.count
        }
        return 0
    }
    
    func CellForRowAt(indexPath: IndexPath) -> Planning {
        return AllEvents[indexPath.row]
    }
}
