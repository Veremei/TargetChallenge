//
//  Color+Extension.swift
//  Color+Extension
//
//  Created by Daniil Veramei on 23.08.2021.
//

import UIKit
import SwiftUI

extension Color {
    init(hexString: String, alpha: Double = 1) {
        let hex = UInt(hexString, radix: 16) ?? 0
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xff) / 255,
                  green: Double((hex >> 08) & 0xff) / 255,
                  blue: Double((hex >> 00) & 0xff) / 255,
                  opacity: alpha)
    }
    
    static let adjustedClear = Color.black.opacity(0.0001)
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1) {
        let hex = UInt(hexString, radix: 16) ?? 0
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255,
                  green: CGFloat((hex >> 08) & 0xff) / 255,
                  blue: CGFloat((hex >> 00) & 0xff) / 255,
                  alpha: alpha)
    }
}
