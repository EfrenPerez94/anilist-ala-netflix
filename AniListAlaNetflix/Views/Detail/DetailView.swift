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
}

/// Detail View. Show the anime description and organize the details on a table view.
class DetailView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = try? "000000".getColor()
        addSubview(animeDescription)
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private properties
    
    private var isViewConstrained = false
    private let headers = ["Website:", "Status", "Season", "Format", "Episodes", "Duration"]
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailCell.self, forCellReuseIdentifier: .animeCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        tableView.backgroundColor = try? "000000".getColor()
        return tableView
    }()
    
    lazy private var animeDescription: UILabel = {
        let animeDescription = UILabel()
        animeDescription.backgroundColor = try? "000000".getColor()
        animeDescription.textColor = try? "FFFFFF".getColor()
        animeDescription.numberOfLines = 0
        animeDescription.textAlignment = .center
        animeDescription.translatesAutoresizingMaskIntoConstraints = false
        animeDescription.text = "Anime Description\nHello!\n Bye :)"
        return animeDescription
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
                animeDescription.topAnchor.constraint(equalTo: topAnchor),
                animeDescription.widthAnchor.constraint(equalTo: widthAnchor),
                animeDescription.heightAnchor.constraint(equalToConstant: frame.height / 3),
                animeDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                tableView.leftAnchor.constraint(equalTo: leftAnchor),
                tableView.topAnchor.constraint(equalTo: animeDescription.bottomAnchor),
                tableView.rightAnchor.constraint(equalTo: rightAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(tableView.rowHeight))
                
            ]
            NSLayoutConstraint.activate(constraints)
            isViewConstrained = true
        }
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: .animeCell, for: indexPath) as? DetailCell) else {
            fatalError("DetailCell is not initialized")
        }
        cell.isUserInteractionEnabled = false
        cell.backgroundColor = try? "000000".getColor()
        cell.title.text = headers[indexPath.row]
        return cell
    }
}
