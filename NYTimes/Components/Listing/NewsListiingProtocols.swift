//
//  NewsListiingProtocols.swift
//  NYTimes
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

//MARK: Wireframe -
protocol NewsListingWireframeProtocol : class {
    func showNewsDetail(news: News)
}

//MARK: Presenter -
protocol NewsListingPresenterProtocol: class {
    
    var interactor: NewsListingInteractorInputProtocol? { get set }
    
    var result : Results? { set get }
    var page : Int { set get }
    func viewDidLoad()
    
    func startFetchingNews(page : Int)
    func showNewsDetail(indexPath: IndexPath)
}

//MARK: Interactor -
protocol NewsListingInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */
    func fetchNews(result: Results)
    
    func showError(error: Error)
}

protocol NewsListingInteractorInputProtocol: class {
    
    var presenter: NewsListingInteractorOutputProtocol?  { get set }
    
    /* Presenter -> Interactor */
    func fetchNews(page: Int)
}

//MARK: View -
protocol NewsListingViewProtocol: class {
    
    var presenter: NewsListingPresenterProtocol?  { get set }
    
    /* Presenter -> ViewController */
    
    func showLoader()
    func hideLoader()
    func refreshView()
    func showError(error: Error)
}


