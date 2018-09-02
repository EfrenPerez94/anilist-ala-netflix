//
//  String.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/19/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Use `GetColorError` to specify problems with getColor function.
enum HexadecimalError: Error {
    case wrongHexadecimalValue
    case wrongCharactersCount
}

extension String {
    
    ///  Helpful to get a UIColor from an hexadecimal value.
    ///
    ///  The hexadecimal value can contain prefix "#" or not.
    ///
    /// - Returns: An UIColor from the hexadecimal value provided.
    /// - Throws: A custom `GetColorError`.
    func getColor() throws -> UIColor {
        
        var hexadecimal = self
        let charset = CharacterSet(charactersIn: "0123456789abcdef")
        
        if hexadecimal.hasPrefix("#") {
            hexadecimal.remove(at: hexadecimal.startIndex)
        }
        
        if hexadecimal.lowercased().rangeOfCharacter(from: charset.inverted) != nil {
            throw HexadecimalError.wrongHexadecimalValue
        }
        
        if hexadecimal.count != 6 {
            throw HexadecimalError.wrongCharactersCount
        }
        var rgb: UInt32 = 0
        Scanner(string: hexadecimal).scanHexInt32(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16 / 255),
                            green: CGFloat((rgb & 0x00FF00) >> 8 / 255),
                            blue: CGFloat(rgb & 0x0000FF / 255),
                            alpha: 1.0)
    }
}
