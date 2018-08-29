//
//  customTable.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/29/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Detail Cell. Create a custom cell for anime details.
class DetailCell: UITableViewCell {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(message)
        addSubview(iconImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    // MARK: - Public properties
    lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.contentMode = .scaleAspectFit
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.backgroundColor = try? "FFFF00".getColor()
        return iconImage
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 17)
        title.textAlignment = .center
        title.textColor = try? "FFFFFF".getColor()
        title.text = "NAME"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var message: UILabel = {
        let message = UILabel()
        message.font = UIFont.systemFont(ofSize: 16)
        message.textAlignment = .center
        message.textColor = .white
        message.text = "data data"
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
        let aspectRatio: CGFloat = 3 / 4
        if !isViewConstrained {
            let constraints = [
                iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                iconImage.widthAnchor.constraint(equalToConstant: frame.height * aspectRatio ),
                iconImage.heightAnchor.constraint(equalToConstant: frame.height * aspectRatio ),
                iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                title.leadingAnchor.constraint(equalTo: iconImage.leadingAnchor, constant: 10),
                title.centerYAnchor.constraint(equalTo: centerYAnchor),
                title.widthAnchor.constraint(equalToConstant: frame.width / 2),
                title.heightAnchor.constraint(equalToConstant: frame.height * aspectRatio),
                
                message.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                message.widthAnchor.constraint(equalToConstant: frame.width / 3),
                message.heightAnchor.constraint(equalToConstant: frame.height * aspectRatio),
                message.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
