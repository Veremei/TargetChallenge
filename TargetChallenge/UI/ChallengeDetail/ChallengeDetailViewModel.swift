//
//  ChallengeDetailViewModel.swift
//  ChallengeDetailViewModel
//
//  Created by Daniil Veramei on 26.08.2021.
//

import SwiftUI

class ChallengeDetailViewModel: ObservableObject {
    
    @Published var target: Target
    
    init(target: Target = Target.mockData[0]) {
        self.target = target
    }
}
