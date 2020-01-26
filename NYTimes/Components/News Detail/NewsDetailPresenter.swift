//
//  NewsDetailPresenter.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation

class NewsDetailPresenter : NewsDetailsPresenterProtocol, NewsDetailsInteractorOutputProtocol {
    
    
    weak private var view: NewsDetailsViewProtocol?
    var interactor: NewsDetailsInteractorInputProtocol?
    private let router: NewsDetailWireframeProtocol
    
    var news: News?
    
    
    init(interface: NewsDetailsViewProtocol, interactor: NewsDetailsInteractorInputProtocol?, router: NewsDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad() {
        guard let news = news,
            let title = news.title,
            let description = news.abstract else {
                //ShowError
                return
        }
        
        self.view?.setNavigationTitle(title: title)
        self.view?.setupNews(title: title, description: description)
        
        //Check count to avoid crash - index out of bound
        if let media = news.media,
            media.count > 0 {
            let mediaObj = media[0]
            
            if let mediaMetadata = mediaObj.mediaMetadata,
                mediaMetadata.count > 0 {
                let url = mediaMetadata[0]
                if let url = url.url  {
                    self.view?.loadImage(url: url)
                }
            }
        }
    }
    
    
    
    
}
