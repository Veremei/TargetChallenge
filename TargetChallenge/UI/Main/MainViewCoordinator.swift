//
//  MainViewCoordinator.swift
//  MainViewCoordinator
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

final class MainViewCoordinator: CoordinatorProtocol {
    
    let targetsListCoordinator = TargetsListCoordinator()
    
    private lazy var viewModel = MainViewModel { [weak self] action in
        guard let self = self else {
            return AnyView.defaultError
        }
        
        switch action {
        case .list:
            return self.buildList()
        }
    }
    
    func build() -> AnyView {
        MainView(viewModel: viewModel).toAnyView()
    }
    
    func buildList() -> AnyView {
        targetsListCoordinator.build()
    }
}

