//
//  CustomCollectionViewCell.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Anime Collection View Cell. Create a custom cell for an anime.
class AnimeCollectionViewCell: UICollectionViewCell {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(animeName)
        addSubview(animePoster)
        backgroundColor = try? "0A0A0A".getColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    lazy private var animeName: UILabel = {
        let label = UILabel()
        label.textColor = try? "FFFFFF".getColor()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "lorem"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var animePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.imageFromURL("https://cdn.anilist.co/img/dir/anime/med/1-K8GMFCAzTIin.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Constraints setup.
    override open class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    private func setupConstraints() {
        if !isViewConstrained {
            let contraints = [
                animePoster.topAnchor.constraint(equalTo: topAnchor),
                animePoster.heightAnchor.constraint(equalToConstant: frame.width * 1.5),
                animePoster.widthAnchor.constraint(equalToConstant: frame.width),
                animePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                animeName.topAnchor.constraint(equalTo: animePoster.bottomAnchor),
                animeName.centerXAnchor.constraint(equalTo: centerXAnchor),
                animeName.heightAnchor.constraint(equalToConstant: frame.height / 5),
                animeName.widthAnchor.constraint(equalTo: widthAnchor)
            ]
            NSLayoutConstraint.activate(contraints)
            isViewConstrained = true
        }
    }
}
