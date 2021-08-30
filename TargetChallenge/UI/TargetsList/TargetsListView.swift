//
//  TargetsListView.swift
//  TargetsListView
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct TargetsListView: View {
    
    @ObservedObject var viewModel: TargetsListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.targets) { target in
                        NavigationLink {
                            ChallengeDetailCoordinator(target: target).build()
                        } label: {
                            TargetRow(target: target)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 24)
            }
            
            .navigationTitle("My targets")
        }
    }
}

struct TargetsListView_Previews: PreviewProvider {
    static var previews: some View {
        TargetsListView(viewModel: TargetsListViewModel())
            .previewDevice("iPhone 12 Pro Max")
    }
}
