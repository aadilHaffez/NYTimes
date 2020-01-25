//
//  NewsListingViewController.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 25/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import UIKit

class NewsListingViewController: UIViewController {

    var presenter: NewsListingPresenterProtocol?

    
    @IBOutlet weak var tableview_news_listing: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableview_news_listing.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        tableview_news_listing.accessibilityIdentifier = "NewsTableViewIdentifier"

        //Fetch News.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.fetchNews()
        }

    }
    
    
    private func fetchNews() {
         if NetworkManager.shared.isReachable {
                self.loader.startAnimating()
                self.presenter?.startFetchingNews(page: 1)
            }else {
                //Now Internet.
                let alert_controller = UIAlertController(title: "No Internet Connection", message: "Please verify you are connected to Wifi, cellular & restart App", preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
                    print("You've pressed default");
                }
                
                alert_controller.addAction(action1)
                self.present(alert_controller, animated: true, completion: nil)
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsListingViewController : NewsListingViewProtocol {
    func showLoader() {
        DispatchQueue.main.async {
            self.loader.startAnimating()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader.isHidden = true
            self.loader.stopAnimating()
        }
    }
    
    func refreshView() {
        self.tableview_news_listing.reloadData()
    }
    
    func showError(error: Error) {
        let alert_controller = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        
        alert_controller.addAction(action1)
        self.present(alert_controller, animated: true, completion: nil)
    }
}

extension NewsListingViewController : StoryboardInitializable { }

