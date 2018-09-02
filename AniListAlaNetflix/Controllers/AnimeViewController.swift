//
//  AnimeViewController.swift
//  wizelineHomework
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// String extension to store cell identifiers.
private extension String {
    static let listCell = "ListCellIdentifier"
    static let homeCell = "HomeCellIdentifier"
}

/// Anime View Controller. Shows a Table View with embedded collection views.
class AnimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View Configuration
        navigationItem.title = "Home"
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height / 4
        view.addSubview(tableView)
        
        // Registration of cells
        tableView.register(AnimeListTableViewCell.self, forCellReuseIdentifier: .listCell)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: .homeCell)
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 0 {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .listCell, for: indexPath) as? AnimeListTableViewCell) else {
                fatalError("AnimeListTableViewCell is not initialized")
            }
            return cell
        } else {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .homeCell, for: indexPath) as? HomeTableViewCell) else {
                fatalError("HomeTableViewCell is not initialized")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
