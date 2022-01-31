//
//  FeedOldDetailedViewController.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import UIKit

class FeedOldDetailedViewController: UIViewController, FeedDetailedView {
    required init(_ fm: FeedModelView) {
        super.init(nibName: "", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
