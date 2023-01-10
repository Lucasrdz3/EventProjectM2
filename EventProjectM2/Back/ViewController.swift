//
//  ViewController.swift
//  Event
//
//  Created by user232077 on 1/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after
        let requestFactory = RequestFactory()
        //var AllEvents = [Planning]()
        
        func fetchPlanningEvents(completion: @escaping () -> ()) {
            requestFactory.getPlanningList { (errorHandle, events) in
                if let _ = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                    print(errorMessage)
                }
                else if let list = events {
                    print(list[0].fields)
                }
                else {
                    print("Houston we got a problem")
                }
            }
        }
        fetchPlanningEvents {}
    }
}
