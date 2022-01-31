//
//  FeedComposer.swift
//  FeedMedium
//
//  Created by Ethan Keiser on 1/20/22.
//

import Foundation

class FeedComposer {
    
    func composeFeed(detailedNavigation nav: @escaping (FeedModelView)->()) -> FeedViewController {
        
        let feedViewController = FeedViewController()
        let primaryWithFallBack = PrimaryWithFallBack(RemoteFeedApi(UrlSessionClient()), CacheFeedApi(CoreDataClient()))
        
        feedViewController.loadModels = { offset, count in
            primaryWithFallBack.getFeed("https://remoteurl.com/resource", 0, 50) { models, error in
                // map remote models to ui layer model views
                if let remoteModels = models {
                    let viewModels = remoteModels.map {_ in
                    // this is just an example
                        FeedModelView()
                    }
                    // this will create a retain cycle. This is for demonstrations. Generally, Id have a presenter that has a weak reference to the controller
                    feedViewController.display(viewModels)
                }
            }
        }
        
        feedViewController.didSelect = { model in
            nav(model)
        }
        return feedViewController
    }
    
    func composeDetailedFeed(_ model: FeedModelView) -> FeedDetailedViewController {
        let feedDetailedViewController = FeedDetailedViewController(model)
        return feedDetailedViewController
    }
    
    func composeOldDetailedFeed(_ model: FeedModelView) -> FeedOldDetailedViewController {
        let feedDetailedViewController = FeedOldDetailedViewController(model)
        return feedDetailedViewController
    }
}
