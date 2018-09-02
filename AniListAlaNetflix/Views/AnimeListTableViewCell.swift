//
//  collectionViewCel.swift
//  wizelineHomework
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import UIKit

/// String extension to store cell identifiers.
private extension String {
    static let animeCell = "animeCellIdentifier"
}

/// Anime List Table View Cell. Organize the table view cell as a collection view.
class AnimeListTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private func setup() {
        addSubview(collectionView)
    }
    
    private var isViewConstrained = false
    
    lazy private var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(AnimeCollectionViewCell.self, forCellWithReuseIdentifier: .animeCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.white
        
        return collection
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
                collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                collectionView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
                collectionView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
            NSLayoutConstraint.activate(contraints)
            isViewConstrained = true
        }
    }
    
    // MARK: - Collection View Data Source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: .animeCell, for: indexPath) as? AnimeCollectionViewCell) else {
            fatalError("AnimeCollectionViewCell is not initialized")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.height / 2, height: self.frame.height)
    }
}
