//
//  NewsDetailViewController.swift
//  NYTimes
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailViewController : UIViewController, NewsDetailsViewProtocol {
    var presenter: NewsDetailsPresenterProtocol?
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    func setNavigationTitle(title: String) {
        self.title = title
    }
    
    func setupNews(title: String, description: String) {
        DispatchQueue.main.async {
            self.titleLbl.text = title
            self.descriptionTextView.text = description
        }
    }
    
    func loadImage(url: String) {
        self.bannerImage.downloaded(from: url)
    }
    
    
}
extension NewsDetailViewController : StoryboardInitializable {}
