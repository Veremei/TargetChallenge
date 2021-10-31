//
//  TargetRow.swift
//  TargetRow
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct TargetRow: View {
    private struct Layout {
        static let stackSpacing: CGFloat = 16
        static let stackPadding: CGFloat = 8
        static let circleSize = CGSize(width: 32, height: 32)
    }
    
    var target: Target
    
    var body: some View {
        HStack(alignment: .center, spacing: Layout.stackSpacing) {
            Circle()
                .frame(size: Layout.circleSize)
                .foregroundColor(.red)
            
            Text(target.title)
                .font(.title2)
                .bold()
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.all, Layout.stackPadding)
    }
}

struct TargetRow_Previews: PreviewProvider {
    static var previews: some View {
        TargetRow(target: Target.previewData[0])
    }
}
