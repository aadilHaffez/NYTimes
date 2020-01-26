//
//  UIImageView.swift
//  NYTimesMauqah
//
//  Created by aadilkhaskheli on 26/01/2020.
//  Copyright © 2020 aadilkhaskheli. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: (() -> Void)! = nil) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    if completion != nil {
                        completion()
                        
                    }
                    return }
            DispatchQueue.main.async() {
                self.image = image
                if completion != nil {completion()}
                
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, completion: (() -> Void)! = nil) {
        
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode,completion: completion)
    }
}
