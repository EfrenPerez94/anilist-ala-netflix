//
//  tableDetail.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/29/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// String extension to store cell identifiers.
private extension String {
    static let animeCell = "detailCell"
    static let descriptionCell = "descriptionCell"
}

/// Detail View. Show the anime description and organize the details on a table view.
class DetailView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var animeData: AniList? {
        didSet {
            animePoster.imageFromURL(animeData?.data?.media?.bannerImage ?? "")
            tableView.reloadData()
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkBackground
        addSubview(animePoster)
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private properties
    
    private var isViewConstrained = false
    private let headers = ["Website:", "Status", "Season", "Format", "Episodes", "Duration"]
    
    lazy private var animePoster: UIImageView = {
        let animePoster = UIImageView()
        animePoster.translatesAutoresizingMaskIntoConstraints = false
        return animePoster
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailCell.self, forCellReuseIdentifier: .animeCell)
                tableView.register(DescriptionCell.self, forCellReuseIdentifier: .descriptionCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkBackground
        return tableView
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
                animePoster.topAnchor.constraint(equalTo: topAnchor),
                animePoster.heightAnchor.constraint(equalToConstant: frame.height / 5),
                animePoster.widthAnchor.constraint(equalTo: widthAnchor),
                animePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                tableView.leftAnchor.constraint(equalTo: leftAnchor),
                tableView.topAnchor.constraint(equalTo: animePoster.bottomAnchor, constant: 15),
                tableView.rightAnchor.constraint(equalTo: rightAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
}
    
// MARK: - Table View Data Source
extension DetailView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headers.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 0 {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .animeCell, for: indexPath) as? DetailCell) else {
                fatalError("DetailCell is not initialized")
            }
            cell.isUserInteractionEnabled = false
            cell.backgroundColor = .darkBackground
            cell.title.text = headers[indexPath.row - 1]
            switch indexPath.row {
            case 1: cell.message.text = animeData?.data?.media?.siteUrl ?? ""
            case 2: cell.message.text = animeData?.data?.media?.status ?? ""
            case 3: cell.message.text = animeData?.data?.media?.season ?? ""
            case 4: cell.message.text = animeData?.data?.media?.format ?? ""
            case 5: cell.message.text = "\(animeData?.data?.media?.episodes ?? 0)"
            case 6: cell.message.text = "\( animeData?.data?.media?.duration ?? 0)"
            default: cell.message.text = ""
            }
            return cell
        } else {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .descriptionCell, for: indexPath) as? DescriptionCell) else {
                fatalError("DescriptionCell is not initialized")
            }
            cell.selectionStyle = .none
            cell.message.text = animeData?.data?.media?.description
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row > 0 {
            return 60
        } else {
            return frame.height / 4
        }
    }
}
