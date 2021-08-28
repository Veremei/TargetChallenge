//
//  MainViewCoordinator.swift
//  MainViewCoordinator
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

final class MainViewCoordinator: CoordinatorProtocol {
    
    func build() -> AnyView {
        let model = MainViewModel()
        return MainView(viewModel: model).toAnyView()
    }
}

