//
//  ActivityIndicator.swift
//  ActivityIndicator
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct ActivityIndicator: View {
    let backgroundColor: Color
    
    init(backgroundColor: Color = Color(.systemBackground)) {
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(2)
        }
    }
}
