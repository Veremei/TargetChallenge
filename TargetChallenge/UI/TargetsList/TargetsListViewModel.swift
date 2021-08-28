//
//  TargetsListViewModel.swift
//  TargetsListViewModel
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

class TargetsListViewModel: ObservableObject {
    
    @Published var targets: [Target]
    
    init(targets: [Target] = Target.mockData) {
        self.targets = targets
    }
}
