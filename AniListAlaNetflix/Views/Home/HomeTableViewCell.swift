//
//  HomeCell.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/23/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Home Table View Cell. Create a custom cell for Home.
final class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkBackground
        addSubview(backgroundImage)
        addSubview(message)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    lazy private var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = #imageLiteral(resourceName: "homeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    lazy private var message: UILabel = {
        let message = UILabel()
        message.textColor = .lightTextColor
        message.font = UIFont.systemFont(ofSize: 18)
        message.textAlignment = .center
        message.text = "Until 50 animes for season"
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    // MARK: - Constraints setup
    override open class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    private func setupConstraints() {
        if !isViewConstrained {
            let constraints = [
                backgroundImage.topAnchor.constraint(equalTo: topAnchor),
                backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
                backgroundImage.heightAnchor.constraint(equalToConstant: frame.height * Constants.aspectRatio),
                
                message.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 10),
                message.widthAnchor.constraint(equalTo: widthAnchor),
                message.heightAnchor.constraint(equalToConstant: frame.height / 5),
                message.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
