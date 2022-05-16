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

// MARK: - Validations
extension String {
    
    //email-validation:
    func isValidEmail() -> Bool {
        if(self.isEmpty) {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        // return true if email for valid
        return emailTest.evaluate(with: self)
    }
    
    //valid password
    func isValidPassword() -> Bool {
        let regex = try?NSRegularExpression(pattern: passRegEx)
        
        // If regex.matches() exists and isEmpty, return true
        return regex?.matches(in: self.lowercased(), options: [], range: NSMakeRange(0, self.count)).isEmpty == true
    }
}
