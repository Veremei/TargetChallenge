//
//  TargetsListCoordinator.swift
//  TargetsListCoordinator
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

final class TargetsListCoordinator: CoordinatorProtocol {
    
    func build() -> AnyView {
        let model = TargetsListViewModel()
        return TargetsListView(viewModel: model).toAnyView()
    }
    
    func buildDetails(for target: Target) -> AnyView {
        ChallengeDetailCoordinator(target: target).build()
    }
}
