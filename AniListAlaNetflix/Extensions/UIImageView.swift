//
//  UIImageView.swift
//  wizelineHomework
//
//  Created by Efrén Pérez Bernabe on 8/23/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /// Allow download images from web.
    /// - Note: Only HTTPS request are allowed
    /// - Parameter urlString: String with the url image.
    func imageFromURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] (data, _, error) in
            guard error == nil, let data = data else {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data)
                self?.contentMode = .scaleAspectFit
                self?.image = image
            })
        }.resume()
    }
}
