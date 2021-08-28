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
//        NavigationView {
            TargetsListCoordinator().build()
//        }
    }
    
    @ViewBuilder
    private var content: some View {
        Text("Hello")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
