//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Aadil Khaskheli on 4/2/19.
//  Copyright © 2019 Aadil Khaskheli. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview_news: UIImageView!
    
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_by: UILabel!
    @IBOutlet weak var label_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageview_news.layer.masksToBounds = false
        imageview_news.layer.cornerRadius = imageview_news.frame.height/2
        imageview_news.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(news: News) {
        

        DispatchQueue.main.async {
            self.label_title.text = news.title
            self.label_by.text = news.byline
            self.label_date.text = news.publishedDate
        }
        
        //Check count to avoid crash - index out of bound
        if let media = news.media,
            media.count > 0 {
            let mediaObj = media[0]
            
            if let mediaMetadata = mediaObj.mediaMetadata,
                mediaMetadata.count > 0 {
                let url = mediaMetadata[0]
                if let url = url.url  {
                   // self.imageview_news.downloaded(from: url)
                }
            }
        }
    }
}
