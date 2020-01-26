//
//  NewsListingViewController+TableView.swift
//  NYTimes
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit

extension NewsListingViewController : UITableViewDelegate {
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100.0
        //We can use this - if we want height dynamic, based on client requirement of view.
        //UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.showNewsDetail(indexPath: indexPath)
    }
}

extension NewsListingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.result?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {fatalError()}
      
        newsCell.accessibilityIdentifier = "myCell_\(indexPath.row)"

        guard let news = self.presenter?.result?.results? [indexPath.row] else {fatalError()}
        newsCell.setupCell(news: news)
        return newsCell
    }
}

