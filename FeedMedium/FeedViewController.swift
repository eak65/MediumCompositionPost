//
//  ViewController.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/19/22.
//

import UIKit
class LoggingFrameWork {
    static func log(_ string:String) {
    }
}

class FeedViewController: UITableViewController {
    var feedModelViews = [FeedModelView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = feedModelViews[indexPath.row]
        if #available(iOS 9.0, *) {
            
            let detailedViewController = FeedDetailedViewController(model)
            LoggingFrameWork.log("\(detailedViewController.self)")
            self.navigationController?.pushViewController(detailedViewController, animated: true)
            
        } else {
            
            let feedOldDetailedViewController = FeedOldDetailedViewController(model)
            LoggingFrameWork.log("\(feedOldDetailedViewController.self)")
            self.navigationController?.pushViewController(feedOldDetailedViewController, animated: true)
        }
    }


}

