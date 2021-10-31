//
//  String+Extension.swift
//  TargetChallenge
//
//  Created by Daniil Veramei on 31.10.2021.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
