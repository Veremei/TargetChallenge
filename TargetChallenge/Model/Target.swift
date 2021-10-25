//
//  Target.swift
//  Target
//
//  Created by Daniil Veramei on 22.08.2021.
//

import Foundation
import SwiftUI

struct Target: Codable, Identifiable, Equatable {
    var id: Int
    var title, description, answer: String
    var modelLabels: [String]
    var hints: String?
    var imageURL: String?
    var isGuessed, isPinned: Bool
}

extension Target {
    static let mockData = TargetStore(load("targetsList.json"))
    static let previewData: [Target] = load("targetsList.json")
}

struct TargetStore {
    var all: [Target] {
        get { _all }
        set { _all = newValue; sortAll() }
    }
    var _all: [Target]
    
    var pinned: [Target] {
        get {
            all.prefix { $0.isPinned }
        }
        set {
            if let end = all.firstIndex(where: { !$0.isPinned }) {
                all.replaceSubrange(all.startIndex..<end, with: newValue)
            }
        }
    }
    
    var unpinned: [Target] {
        get {
            if let start = all.firstIndex(where: { !$0.isPinned }) {
                return Array(all.suffix(from: start))
            } else {
                return []
            }
        }
        set {
            if let start = all.firstIndex(where: { !$0.isPinned }) {
                all.replaceSubrange(start..<all.endIndex, with: newValue)
            }
        }
    }
        
    init(_ targets: [Target]) {
        _all = targets
        sortAll()
    }
    
    private mutating func sortAll() {
        _all.sort { lhs, rhs in
            if lhs.isPinned && !rhs.isPinned {
                return true
            } else if !lhs.isPinned && rhs.isPinned {
                return false
            } else {
                return lhs.id < rhs.id
            }
        }
    }
}
