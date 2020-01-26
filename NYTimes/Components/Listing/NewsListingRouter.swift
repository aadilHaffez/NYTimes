//
//  NewsListingRouter.swift
//  NYTimes
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit
class NewsListingRouter : NewsListingWireframeProtocol {
    
    
    var viewController : UIViewController?
    var navigationController : UINavigationController?
    
    static func createModule(using navigationController : UINavigationController) -> UIViewController{
        let view = NewsListingViewController.initFromStoryboard(name: "News")
        let interactor = NewsListingInteractor()
        let router = NewsListingRouter()
        let presenter = NewsListingPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.navigationController = navigationController
        
        return view
    }
    
    func showNewsDetail(news: News) {
        let controller = NewsDetailRouter.createModule(news: news)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
