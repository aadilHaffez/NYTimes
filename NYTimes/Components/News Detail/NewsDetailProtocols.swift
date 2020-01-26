//
//  NewsDetailProtocols.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol NewsDetailWireframeProtocol : class{
    
}

//MARK: Presenter -
protocol NewsDetailsPresenterProtocol : class{
    var interactor : NewsDetailsInteractorInputProtocol? {get set}
    var news : News? {set get}
    func viewDidLoad()
}

//MARK: Interactor -
protocol NewsDetailsInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */
}

protocol NewsDetailsInteractorInputProtocol: class {
    
    var presenter: NewsDetailsInteractorOutputProtocol?  { get set }
    
    /* Presenter -> Interactor */
}

//MARK: View -
protocol NewsDetailsViewProtocol: class {
    
    var presenter: NewsDetailsPresenterProtocol?  { get set }
    
    /* Presenter -> ViewController */
    
    
    
    func setNavigationTitle(title: String)
    
    func setupNews(title: String, description: String)
    func loadImage(url: String)
}
