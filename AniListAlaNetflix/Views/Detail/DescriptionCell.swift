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
    
    lazy var message: UITextView = {
        let message = UITextView()
        message.isEditable = false
        message.textColor = .lightTextColor
        message.font = UIFont.systemFont(ofSize: 15)
        message.textAlignment = .center
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
                message.centerXAnchor.constraint(equalTo: centerXAnchor),
                message.widthAnchor.constraint(equalTo: widthAnchor),
                message.heightAnchor.constraint(equalTo: heightAnchor, constant: -10),
                message.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
