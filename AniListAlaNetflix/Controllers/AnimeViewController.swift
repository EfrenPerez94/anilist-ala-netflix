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
}

/// Anime View Controller. Shows a Table View with embedded collection views.
class AnimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View Configuration
        navigationItem.title = "My NETFLIX App"
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = view.frame.height / 4
        view.addSubview(tableView)
        
        // Registration of cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: .listCell)
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: .listCell, for: indexPath))
        return cell
       
    }
}
