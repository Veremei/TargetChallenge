//
//  ChallengeDetailCoordinator.swift
//  ChallengeDetailCoordinator
//
//  Created by Daniil Veramei on 26.08.2021.
//

import SwiftUI

final class ChallengeDetailCoordinator: CoordinatorProtocol {
    
    private let target: Target
    
    init(target: Target) {
        self.target = target
    }
    
    func build() -> AnyView {
        let model = ChallengeDetailViewModel(target: target)
        return ChallengeDetailView(viewModel: model).toAnyView()
    }
}
