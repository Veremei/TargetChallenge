//
//  TargetRow.swift
//  TargetRow
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

struct TargetRow: View {
    var target: Target
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Circle()
                .frame(width: 36, height: 36)
                .foregroundColor(.red)
            
            Text(target.title)
                .font(.title2)
                .bold()
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color(hexString: "F1F2F6")).frame(height: 80)
        )
    }
}

struct TargetRow_Previews: PreviewProvider {
    static var previews: some View {
        TargetRow(target: Target.mockData[0])
    }
}
