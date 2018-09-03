//
//  AnimeViewController.swift
//  AniListAlaNetflix
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
class AnimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AnimeListDelegate {
    
    // MARK: - Private properties
    private var tableView: UITableView!
    private var loadAnimesIndicator: UIActivityIndicatorView!
    private var animesBySeason: [AniList] = []
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AniList"
        tableViewSetup()
        indicatorSetup()
    }

    // MARK: - View Controller configuration
    /// Dispatch group. useful to wait until all the animes where retrieved.
    func getAllSeasons() {
        let aniListRequests = DispatchGroup()
        let animesRepository = AniListRepository()
        var querys: [Parameters] = []
        querys.append(retriveAnimesForSeason(fromPage: 1, animesPerPage: 50, season: .winter))
        querys.append(retriveAnimesForSeason(fromPage: 1, animesPerPage: 50, season: .spring))
        querys.append(retriveAnimesForSeason(fromPage: 1, animesPerPage: 50, season: .summer))
        querys.append(retriveAnimesForSeason(fromPage: 1, animesPerPage: 50, season: .fall))
        
        for query in querys {
            aniListRequests.enter()
            animesRepository.execute(query: query) { [weak self] data in
                guard let weakSelf = self,
                    let animes = data else {
                        fatalError("Nil value found")
                }
                weakSelf.animesBySeason.append(animes)
                defer { aniListRequests.leave() }
            }
        }
        
        aniListRequests.notify(queue: .main) { [weak self] in
            guard let weakSelf = self else {
                fatalError("Self contains a nil value")
            }
            weakSelf.tableView.reloadData()
            weakSelf.loadAnimesIndicator.removeFromSuperview()
        }
    }

    /// Indicator configuration.
    fileprivate func indicatorSetup() {
        loadAnimesIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        loadAnimesIndicator.center = view.center
        loadAnimesIndicator.startAnimating()
        view.addSubview(loadAnimesIndicator)
    }

    /// Table View configuration.
    fileprivate func tableViewSetup() {
        tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkBackground
        tableView.rowHeight = view.frame.height / 3
        tableView.register(AnimeListTableViewCell.self, forCellReuseIdentifier: .listCell)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: .homeCell)
        view.addSubview(tableView)
        getAllSeasons()
    }

    func pushDetailViewFor(id: Int) {
        navigationController?.pushViewController(DetailViewController(with: id), animated: true)
    }
}

    // MARK: - Table view data source

extension AnimeViewController {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Season.allValues.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > 0 {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .listCell, for: indexPath) as? AnimeListTableViewCell) else {
                fatalError("AnimeListTableViewCell is not initialized")
            }
            cell.delegate = self
            cell.selectionStyle = .none
            if !animesBySeason.isEmpty {
                cell.seasonData = animesBySeason[indexPath.row - 1]
            }
            return cell
        } else {
            guard let cell = (tableView.dequeueReusableCell(withIdentifier: .homeCell, for: indexPath) as? HomeTableViewCell) else {
                fatalError("HomeTableViewCell is not initialized")
            }
            cell.selectionStyle = .none
            return cell
        }
    }
}
