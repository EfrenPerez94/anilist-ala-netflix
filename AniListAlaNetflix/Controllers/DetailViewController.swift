//
//  DetailViewController.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/28/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

/// Detail View Controller. Shows the details and the trailer for a specific anime.
class DetailViewController: UIViewController {
    
    // MARK: - Private properties
    private var loadAnimeIndicator: UIActivityIndicatorView!
    private var videoHeight: CGFloat = 0
    private var animeID: Int
    
    // MARK: - Initializers
    init(with id: Int) {
        self.animeID = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkBackground
        indicatorSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let animeRepository = AniListRepository()
        animeRepository.execute(query: retriveAnime(id: animeID)) { [weak self] data in
            guard let weakSelf = self,
                let anime = data else {
                    let alert = UIAlertController(title: "Error",
                                                  message: "Description not available",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(alert, animated: true)
                    return
            }
            DispatchQueue.main.async {
                weakSelf.navigationItem.title = anime.data?.media?.title.romaji
                weakSelf.trailerSetup(trailerURL: anime.data?.media?.trailer ?? "")
                weakSelf.detailViewSetup(animeData: anime)
                weakSelf.loadAnimeIndicator.removeFromSuperview()
            }
        }
    }
    
    // MARK: - Setup Functions
    fileprivate func indicatorSetup() {
        loadAnimeIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        loadAnimeIndicator.center = view.center
        loadAnimeIndicator.startAnimating()
        view.addSubview(loadAnimeIndicator)
    }
    
    fileprivate func trailerSetup(trailerURL: String) {
        
        guard let url = URL(string: trailerURL) else {
            return
        }
        let frame = CGRect(x: 0, y: topBarHeight, width: view.frame.width, height: view.frame.width * Constants.aspectRatio)
        let player = AVPlayer(url: url)
        let videoController = AVPlayerViewController()
        videoController.player = player
        videoController.view.frame = frame
        videoController.view.setNeedsLayout()
        addChildViewController((videoController))
        view.addSubview((videoController.view))
        videoController.didMove(toParentViewController: self)
        videoHeight = videoController.view.frame.height

    }
    
    fileprivate func detailViewSetup(animeData: AniList) {
        let detailHeight = view.bounds.height - videoHeight
        let yOrigin = videoHeight + topBarHeight
        let detailView = DetailView(frame: CGRect(x: 0, y: yOrigin, width: view.frame.width, height: detailHeight))
        
        detailView.animeData = animeData
        view.addSubview(detailView)
    }
}
