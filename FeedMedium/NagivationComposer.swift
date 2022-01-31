//
//  NagivationComposer.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import Foundation
import UIKit

class NavigationComposer {
    func makeFeedNavigation(_ nav: UINavigationController,_ fc: FeedComposer) -> FeedNavigation {
        let feedNav = FeedNavigation(nav, fc)
        feedNav.delegate = LoggingFrameWorkClient()
        return feedNav
    }
}
