//
//  Strings+TJQ.swift
//  JobinQ
//
//  Created by Ton Silva on 10/5/22.
//

import UIKit

// MARK: - Localizable
protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
