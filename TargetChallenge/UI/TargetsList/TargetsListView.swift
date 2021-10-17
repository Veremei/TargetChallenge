//
//  TargetsListView.swift
//  TargetsListView
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct TargetsListView: View {
    
    @ObservedObject var viewModel: TargetsListViewModel
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.filterText.isEmpty {
                    if !viewModel.targets.pinned.isEmpty {
                        Section("Pinned") {
                            sectionContent(for: $viewModel.targets.pinned)
                        }
                    }
                    
                    Section {
                        sectionContent(for: $viewModel.targets.unpinned)
                    }
                    
                } else {
                    sectionContent(for: $viewModel.filtered)
                }
            }
            .listStyle(.sidebar)
            .searchable(text: $viewModel.filterText)
            .navigationTitle(Text("My targets", comment: "Targets List navigation title"))
        }
    }
    
    @ViewBuilder
    private func sectionContent(for targets: Binding<[Target]>) -> some View {
        ForEach(targets) { $target in
            NavigationLink {
                ChallengeDetailCoordinator(target: target).build()
            } label: {
                TargetRow(target: target)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    withAnimation {
                        target.isPinned.toggle()
                    }
                } label: {
                    if target.isPinned {
                        Label("Unpin", systemImage: "pin.slash")
                    } else {
                        Label("Pin", systemImage: "pin")
                    }
                }
                .tint(.blue)
            }
        }
    }
    
    private func delete<C: RangeReplaceableCollection & MutableCollection>(
        _ character: Target, in characters: Binding<C>
    ) where C.Element == Target {
        withAnimation {
            if let i = characters.wrappedValue.firstIndex(where: {
                $0.id == character.id
            }) {
                characters.wrappedValue.remove(at: i)
            }
        }
    }
    
    
}

struct TargetsListView_Previews: PreviewProvider {
    static var previews: some View {
        TargetsListView(viewModel: TargetsListViewModel())
            .previewDevice("iPhone 12 Pro Max")
    }
}
