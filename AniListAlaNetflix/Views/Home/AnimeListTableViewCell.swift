//
//  collectionViewCel.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import UIKit

/// String extension to store cell identifiers.
private extension String {
    static let animeCell = "animeCellIdentifier"
}

/// The delegate of a `AnimeListTableViewCell` object must adopt the `AnimeListDelegate` protocol.
protocol AnimeListDelegate: class {
    func pushDetailViewFor(id: Int)
}

/// Anime List Table View Cell. Organize the table view cell as a collection view.
final class AnimeListTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Public properties
    weak var delegate: AnimeListDelegate?
    
    var seasonData: AniList? {
        didSet {
            seasonName.text = seasonData?.data?.page?.media?[1].season
            collectionView.reloadData()
        }
    }
    
    // MARK: - Initializers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        backgroundColor = .darkBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private func setup() {
        addSubview(collectionView)
        addSubview(seasonName)
    }
    
    private var isViewConstrained = false
    
    lazy private var seasonName: UILabel = {
        let seasonName = UILabel()
        seasonName.textColor = .lightTextColor
        seasonName.font = UIFont.systemFont(ofSize: 18)
        seasonName.translatesAutoresizingMaskIntoConstraints = false
        return seasonName
    }()
    
    lazy private var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collection.backgroundColor = .darkBackground
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(AnimeCollectionViewCell.self, forCellWithReuseIdentifier: .animeCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
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
                seasonName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                seasonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                seasonName.widthAnchor.constraint(equalToConstant: frame.width * Constants.aspectRatio),
                seasonName.heightAnchor.constraint(equalToConstant: frame.height / 15),
                
                collectionView.topAnchor.constraint(equalTo: seasonName.bottomAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                collectionView.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
                collectionView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
            NSLayoutConstraint.activate(contraints)
            isViewConstrained = true
        }
    }
}

// MARK: - Collection View Data Source

extension AnimeListTableViewCell {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (seasonData?.data?.page?.media?.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: .animeCell, for: indexPath) as? AnimeCollectionViewCell) else {
            fatalError("AnimeCollectionViewCell is not initialized")
        }
        cell.prepareForReuse()
        cell.cellData = seasonData?.data?.page?.media?[indexPath.row]
        cell.cellID = seasonData?.data?.page?.media?[indexPath.row].id
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let customCellHeight = frame.height * Constants.aspectRatio
        return CGSize(width: customCellHeight / 2, height: customCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimeCollectionViewCell,
            let cellID = cell.cellID else {
                fatalError("Unable cast cell as AnimeCollectionViewCell")
        }
        delegate?.pushDetailViewFor(id: cellID)
    }
}
