//
//  ChallengeDetailView.swift
//  ChallengeDetailView
//
//  Created by Daniil Veramei on 23.08.2021.
//

import SwiftUI

struct ChallengeDetailView: View {
    
    @ObservedObject var model: ChallengeDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(model.target.title)
                    .font(.title)
                    .bold()
                
                if model.target.guessed {
                    Text(model.target.answer)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(hexString: "F6F6F6"))
                        )
                }
                
                
                Text("Загадка: \(model.target.description)")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                    )
                
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(Color(hexString: "ECE4E4")).aspectRatio(1, contentMode: .fit)
                
                Text("😽 😽 😽")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                    )
                
                Button(action: { }) {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color(hexString: "ECE4E4"))
                        .overlay(Text("Проверить").foregroundColor(.black))
                }
                .frame(width: .infinity, height: 44, alignment: .center)
                
                Spacer()
            }.padding(.horizontal, 32)
                .padding(.vertical)
        }
    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(
            model: ChallengeDetailViewModel(target: Target.mockData[0])
        )
    }
}
