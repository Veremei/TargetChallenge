//
//  MainViewModel.swift
//  MainViewModel
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

enum MainViewModelAction {
    case list
}

typealias MainViewModelCallback = (MainViewModelAction) -> AnyView

class MainViewModel: ObservableObject {
    
    private let callback: MainViewModelCallback
    
    init(callback: @escaping MainViewModelCallback) {
        self.callback = callback
    }
    
    func buildList() -> AnyView {
        callback(.list)
    }
}
