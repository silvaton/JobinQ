//
//  DSSettings.swift
//  JobinQ
//
//  Created by Ton Silva on 10/5/22.
//

import UIKit

class DSSettings {
    
    //MARK: - Fonts
    struct Font {
        static let appTitle = UIFont(name: "AmericanTypewriter-CondensedLight", size: 90)!
        static let smallFontLight = UIFont(name: "AmericanTypewriter-Light", size: 12)!
        static let mediumFontLight = UIFont(name: "AmericanTypewriter-Light", size: 16)!
        static let bigFontLight = UIFont(name: "AmericanTypewriter-Light", size: 24)!
        static let xBigFontLight = UIFont(name: "AmericanTypewriter-Light", size: 36)!
        static let smallFontRegular = UIFont(name: "AmericanTypewriter", size: 12)!
        static let mediumFontRegular = UIFont(name: "AmericanTypewriter", size: 16)!
        static let bigFontRegular = UIFont(name: "AmericanTypewriter", size: 24)!
        static let xBigFontRegular = UIFont(name: "AmericanTypewriter", size: 36)!
        static let smallFontBold = UIFont(name: "AmericanTypewriter-Bold", size: 12)!
        static let mediumFontBold = UIFont(name: "AmericanTypewriter-Bold", size: 16)!
        static let bigFontBold = UIFont(name: "AmericanTypewriter-Bold", size: 24)!
        static let xBigFontBold = UIFont(name: "AmericanTypewriter-Bold", size: 36)!
    }
    
    //MARK: - Margin
    enum Margin: CGFloat {
        case none = 0
        case xxsmall = 2
        case xsmall = 4
        case small = 8
        case medium = 16
        case large = 24
        case xlarge = 32
        case xxlarge = 40
        case xxxlarge = 48
        case extralarge = 56
        case xextralarge = 64
    }
    
    // MARK: - Button
    enum ButtonSize: CGFloat {
        case small = 24
        case medium = 36
        case large = 50
        case xlarge = 80
        case xxlarge = 110
        case xxxlarge = 140
    }
    
    // MARK: - RoundedCorner
    enum RoundedCorner: CGFloat {
        case none = 0
        case small = 4
        case medium = 8
        case xmedium = 12
        case large = 16
    }
    
    //MARK: - Layout
    enum Layout: CGFloat {
        case smallSpacing = 8
        case mediumSpacing = 16
    }
}
