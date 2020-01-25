//
//  NewsListingPresenter.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

class NewsListingPresenter : NewsListingPresenterProtocol, NewsListingInteractorOutputProtocol {
    
    
    weak private var view: NewsListingViewProtocol?
    var interactor: NewsListingInteractorInputProtocol?
    private let router: NewsListingWireframeProtocol
    
    var result: Results?
    var page: Int = 0
    

    init(interface : NewsListingViewProtocol, interactor : NewsListingInteractorInputProtocol?, router : NewsListingWireframeProtocol) {
        self.view = interface
        self.router = router
        self.interactor = interactor
        
    }
    
    func viewDidLoad() {
        self.page = 0
    }
    
    func startFetchingNews(page: Int) {
        self.page = page
        self.view?.showLoader()
        self.interactor?.fetchNews(page: page)

    }
    
    func showNewsDetail(indexPath: IndexPath) {
        
    }
    
    func fetchNews(result: Results) {
        self.result = result
        self.view?.hideLoader()
        self.view?.refreshView()
    }
    
    func showError(error: Error) {
        self.view?.showError(error: error)

    }
    
    
}
