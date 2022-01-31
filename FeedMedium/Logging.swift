//
//  Logging.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import Foundation
import UIKit

class LoggingFrameWorkClient: NavigationOutput {
    func navigatedTo(_ controller: UIViewController) {
        LoggingFrameWork.log("\(controller.self)")

    }
}
