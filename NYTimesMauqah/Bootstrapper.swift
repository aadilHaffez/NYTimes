//
//  Bootstrapper.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit
struct Bootstrapper {
    var window : UIWindow
    static var instance : Bootstrapper? = nil
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func initialize() {
        
        NetworkManager.shared.startListening()
        
        instance = Bootstrapper(window: makeNewWindow())
        instance!.bootstrap()
    }
    
    private static func makeNewWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        
        if let del = UIApplication.shared.delegate {
            (del as! AppDelegate).window = window
        }
        
        return window
    }
    
    mutating func bootstrap() {
        showNewsListing()
        window.makeKeyAndVisible()
    }
    
    private func showNewsListing() {

        let navigationController = UINavigationController()

        /* Create ui-view-controller instance*/
        
        let newsListing = NewsListingRouter.createModule(using: navigationController)

        /* Initiating instance of ui-navigation-controller with view-controller */
        navigationController.viewControllers = [newsListing]

        /* Setting up the root view-controller as ui-navigation-controller */
        window.rootViewController = navigationController
    }
}
