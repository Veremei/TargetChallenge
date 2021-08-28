//
//  ChallengeDetailView.swift
//  ChallengeDetailView
//
//  Created by Daniil Veramei on 23.08.2021.
//

import SwiftUI

struct ChallengeDetailView: View {
    private struct Layout {
        static let mainStackSpacing: CGFloat = 24
        static let mainStackHPadding: CGFloat = 32
        static let cornerRadius: CGFloat = 6
        static let bottomButtonHeight: CGFloat = 54
        static let descriptionVerticalPadding: CGFloat = 24
        static let checkButtonShadowRadius: CGFloat = 24
    }
    
    @ObservedObject var model: ChallengeDetailViewModel
    
    @State private var showHints = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: Layout.mainStackSpacing) {
                Text(model.target.title)
                    .font(.title)
                    .bold()
                
                if model.target.guessed {
                    Text(model.target.answer)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: Layout.cornerRadius)
                                .foregroundColor(Color(hexString: "F6F6F6"))
                        )
                }
                
                Text("\(model.target.description)")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, Layout.descriptionVerticalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                    )
                
                RoundedRectangle(cornerRadius: Layout.cornerRadius)
                    .foregroundColor(Color(hexString: "ECE4E4"))
                    .aspectRatio(1, contentMode: .fit)
                
                if let hints = model.target.hints {
                    Button(action: {
                        showHints = !showHints
                    }) {
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                            .overlay(
                                Text(showHints ? hints : "Подсказка")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            )
                    }
                    .frame(width: .infinity, height: Layout.bottomButtonHeight, alignment: .center)
                }
                
                Button(action: { }) {
                    RoundedRectangle(cornerRadius: Layout.cornerRadius)
                        .foregroundColor(Color(hexString: "ECE4E4"))
                        .overlay(
                            Text("Проверить")
                                .foregroundColor(.black)
                        )
                }
                .frame(width: .infinity, height: Layout.bottomButtonHeight, alignment: .center)
                .shadow(radius: Layout.checkButtonShadowRadius)
                
                Spacer()
            }
            .padding(.horizontal, Layout.mainStackHPadding)
            .padding(.vertical)
        }
    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeDetailView(
            model: ChallengeDetailViewModel(target: Target.mockData[0])
        )
            .previewDevice("iPhone 12 Pro Max")
    }
}
