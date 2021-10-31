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
                content
            }
            .listStyle(.sidebar)
#if os(iOS)
            .searchable(text: $viewModel.filterText)
#endif
            .navigationTitle(Text("targets_list_navigation_title", comment: "Targets list navigation title"))
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.filterText.isEmpty {
            if !viewModel.targets.pinned.isEmpty {
                if #available(macOS 12.0, *) {
                    Section(header: Text("targets_list_section_pinned", comment: "Targets list pinned section header")) {
                        sectionContent(for: $viewModel.targets.pinned)
                    }
                } else {
                    Section {
                        sectionContent(for: $viewModel.targets.pinned)
                    }
                }
            }
            
            Section {
                sectionContent(for: $viewModel.targets.unpinned)
            }
            
        } else {
            sectionContent(for: $viewModel.filtered)
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
#if os(iOS)
            .swipeActions(edge: .leading) {
                Button {
                    withAnimation {
                        target.isPinned.toggle()
                    }
                } label: {
                    if target.isPinned {
                        Image(systemName: "pin.slash")
                    } else {
                        Image(systemName: "pin")
                    }
                }
                .tint(.yellow)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    // share item
                } label: {
                    Image(systemName: "arrowshape.turn.up.left")
                }
                .tint(.blue)
            }
#elseif os(macOS)
            // add
#endif
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
