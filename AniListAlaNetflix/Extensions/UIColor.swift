//
//  UIColor.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 9/3/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// Palette color for the application.
    static let darkBackground = try? "1F232C".getColor()
    static let lightTextColor = try? "E1E1E1".getColor()
}
