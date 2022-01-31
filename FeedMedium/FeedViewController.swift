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
class Crashlytics {
    static func log(_ string:String) {
        
    }
}
protocol FeedView {
    func display(_ models:[FeedModelView])
}

class FeedViewController: UITableViewController, FeedView {
    var feedModelViews = [FeedModelView]()
    
    var didSelect : ((FeedModelView) -> ())?
    var loadModels : ((Int,Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModels?(0,50)
    }
    func display(_ models: [FeedModelView]) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.feedModelViews = models
            strongSelf.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = feedModelViews[indexPath.row]
        didSelect?(model)
    }


}

