//
//  UIViewController.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/28/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    /// Obtain the height of the top bar view as CGFloat.
    var topBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
