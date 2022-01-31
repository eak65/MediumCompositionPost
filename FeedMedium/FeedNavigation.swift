//
//  FeedNavigation.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import Foundation
import UIKit
protocol NavigationOutput {
    func navigatedTo(_ controller: UIViewController)
}
class FeedNavigation {
    let navigation : UINavigationController
    let feedComposer : FeedComposer
    var delegate : NavigationOutput?
    
    init(_ nav: UINavigationController, _ fc: FeedComposer) {
        navigation = nav
        feedComposer = fc
    }
    func navigatedToFeed() {
        let fv =  feedComposer.composeFeed(detailedNavigation: self.navigateToFeedDetailedViewController)
        delegate?.navigatedTo(fv)
        navigation.setViewControllers([fv], animated: true)
    }
    
    func navigateToFeedDetailedViewController(_ model: FeedModelView) {
        if #available(iOS 9.0, *) {
           let fdv = feedComposer.composeDetailedFeed(model)
            delegate?.navigatedTo(fdv)
            navigation.pushViewController(fdv, animated: true)
        } else {
            let ofdv = feedComposer.composeOldDetailedFeed(model)
            delegate?.navigatedTo(ofdv)
            navigation.pushViewController(ofdv, animated: true)
        }

    }
    
}
