//
//  TargetsListViewModel.swift
//  TargetsListViewModel
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI
import Combine

class TargetsListViewModel: ObservableObject {
    
    @Published var targets: TargetStore
    @Published var filterText: String = ""
    @Published var filtered: [Target] = []
    
    private var cancelledOperations = Set<AnyCancellable>()
    
    init(targets: TargetStore = Target.mockData) {
        self.targets = targets
        bind()
    }
    
    private func bind() {
        $filterText
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                
                if value.isEmpty {
                    self.filtered = self.targets.all
                } else {
                    self.filtered = self.targets.all.filter {
                        $0.title.contains(value)
                        || $0.description.contains(value)
                        || $0.hints?.contains(value) == true
                    }
                }
            }
            .store(in: &cancelledOperations)
    }
}
