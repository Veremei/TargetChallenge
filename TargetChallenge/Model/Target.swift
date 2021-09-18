//
//  Target.swift
//  Target
//
//  Created by Daniil Veramei on 22.08.2021.
//

import Foundation
import SwiftUI

struct Target: Hashable, Codable, Identifiable {
    var id: Int
    var title, description, answer: String
    var modelLabels: [String]
    var hints: String?
    var imageURL: String?
    var isGuessed, isPinned: Bool
}

extension Target {
    static let mockData: [Target] = load("targetsList.json")
}
