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
final class AnimeCollectionViewCell: UICollectionViewCell {

    var cellID: Int?
    var cellData: Media? {
        didSet {
            animeTitle.text = cellData?.title.romaji ?? ""
            animePoster.imageFromURL(cellData?.coverImage.medium ?? "")
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(animeTitle)
        addSubview(animePoster)
        backgroundColor = .darkBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private var isViewConstrained = false
    
    lazy private var animeTitle: UILabel = {
        let animeTitle = UILabel()
        animeTitle.textColor = .lightTextColor
        animeTitle.lineBreakMode = .byWordWrapping
        animeTitle.numberOfLines = 0
        animeTitle.font = UIFont.systemFont(ofSize: 12)
        animeTitle.textAlignment = .center
        animeTitle.translatesAutoresizingMaskIntoConstraints = false
        return animeTitle
    }()
    
    lazy private var animePoster: UIImageView = {
        let animePoster = UIImageView()
        animePoster.translatesAutoresizingMaskIntoConstraints = false
        animePoster.center = CGPoint(x: frame.width / 2, y: (frame.height * aspectRatio) / 2)
        return animePoster
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
                animePoster.heightAnchor.constraint(equalToConstant: frame.height * aspectRatio),
                animePoster.widthAnchor.constraint(equalToConstant: frame.width),
                animePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                animeTitle.topAnchor.constraint(equalTo: animePoster.bottomAnchor),
                animeTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
                animeTitle.widthAnchor.constraint(equalTo: widthAnchor),
                animeTitle.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
            NSLayoutConstraint.activate(contraints)
            isViewConstrained = true
        }
    }
}
