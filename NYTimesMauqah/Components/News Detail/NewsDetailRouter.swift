//
//  NewsDetailRouter.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailRouter : NewsDetailWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(news: News?) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = NewsDetailViewController.initFromStoryboard(name: "News")
        
        let interactor = NewsDetailInteractor()
        let router = NewsDetailRouter()
        let presenter = NewsDetailPresenter(interface: view, interactor: interactor , router: router)
        presenter.news = news
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
