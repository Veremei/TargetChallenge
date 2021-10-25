//
//  MainView.swift
//  MainView
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        viewModel.buildList()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(callback: { _ in AnyView.defaultError }))
    }
}
