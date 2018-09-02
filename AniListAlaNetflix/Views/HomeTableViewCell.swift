//
//  HomeCell.swift
//  wizelineHomework
//
//  Created by Efrén Pérez Bernabe on 8/23/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Home Table View Cell. Create a custom cell for Home.
class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(message)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    lazy private var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20)
        title.textAlignment = .center
        title.text = "ANIMES FROM API"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var message: UILabel = {
        let message = UILabel()
        message.font = UIFont.systemFont(ofSize: 16)
        message.textAlignment = .center
        message.text = "lorem ipsum dolor sit amet"
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
                title.centerXAnchor.constraint(equalTo: centerXAnchor),
                title.centerYAnchor.constraint(equalTo: centerYAnchor),
                title.widthAnchor.constraint(equalTo: widthAnchor),
                title.heightAnchor.constraint(equalToConstant: frame.height / 5),
                
                message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
                message.widthAnchor.constraint(equalTo: widthAnchor),
                message.heightAnchor.constraint(equalToConstant: frame.height / 5),
                message.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
