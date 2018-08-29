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
    
    var player = AVPlayer()
    var controller = AVPlayerViewController()
    
    // MARK: - Life View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Generic anime"
        setupTrailer(url: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        setupDetailView()
    }
    
    // MARK: - Setup Functions
    fileprivate func setupTrailer(url: String) {
        
        guard let url = URL(string: url) else {
            let alert = UIAlertController(title: "Opps", message: "This anime doesn't have trailer!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let aspectRatio: CGFloat = 3 / 4
        
        player = AVPlayer(url: url)
        controller.player = self.player
        controller.view.frame = CGRect(x: 0, y: topBarHeight, width: view.frame.width, height: view.frame.width * aspectRatio)
        controller.view.setNeedsLayout()
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)

    }
    
    fileprivate func setupDetailView() {
        let detailHeight = view.frame.height - controller.view.frame.height
        let yOrigin = controller.view.frame.height + topBarHeight
        let table = DetailView(frame: CGRect(x: 0, y: yOrigin, width: view.frame.width, height: detailHeight))
        view.addSubview(table)
    }
}
