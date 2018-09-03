//
//  DescriptionCell.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/31/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Home Table View Cell. Create a custom cell for Home.
final class DescriptionCell: UITableViewCell {
    
    var descriptionText: String? {
        didSet {
            message.text = descriptionText
        }
    }
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .darkBackground
        addSubview(message)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    lazy private var message: UITextView = {
        let message = UITextView()
        message.isUserInteractionEnabled = false
        message.textColor = .lightTextColor
        message.font = UIFont.systemFont(ofSize: 15)
        message.textAlignment = .justified
        message.backgroundColor = .darkBackground
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
                message.bottomAnchor.constraint(equalTo: bottomAnchor),
                message.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                message.topAnchor.constraint(equalTo: topAnchor),
                message.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
