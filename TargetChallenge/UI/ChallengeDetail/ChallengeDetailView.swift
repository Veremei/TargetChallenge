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
        static let checkButtonShadowRadius: CGFloat = 1
    }
    
    @ObservedObject var viewModel: ChallengeDetailViewModel
    
    @State private var showHints = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        ScrollView {
            VStack(spacing: Layout.mainStackSpacing) {
                HStack {
                    Text(viewModel.target.title)
                        .font(.title)
                        .bold()
                    
                    if viewModel.target.isGuessed {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                            .font(.title)
                    }
                }
                
                if viewModel.target.isGuessed {
                    Text(viewModel.target.answer)
                        .bold()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: Layout.cornerRadius)
                                .foregroundColor(Color(hexString: "F6F6F6"))
                        )
                }
                
                Text("\(viewModel.target.description)")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, Layout.descriptionVerticalPadding)
                    .background(
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                    )
                    .shadow(radius: Layout.checkButtonShadowRadius)
                
                
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                } else if !viewModel.target.isGuessed {
                    RoundedRectangle(cornerRadius: Layout.cornerRadius)
                        .foregroundColor(Color(hexString: "ECE4E4"))
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                }
                
                
                if let hints = viewModel.target.hints {
                    Button(action: {
                        if !viewModel.target.isGuessed {
                            showHints = !showHints
                        }
                    }) {
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                            .foregroundColor(Color(hexString: "F6F6F6"))
                            .overlay(
                                Text(showHints || viewModel.target.isGuessed
                                     ? hints
                                     : "target_details_hint".localized)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            )
                    }
                    .frame(height: Layout.bottomButtonHeight, alignment: .center)
                    .disabled(viewModel.target.isGuessed)
                }
                
                if !viewModel.target.isGuessed {
                    Button(action: {
                        if let img = inputImage {
                            viewModel.classifyImage(img)
                        }
                    }) {
                        RoundedRectangle(cornerRadius: Layout.cornerRadius)
                            .foregroundColor(Color(hexString: "ECE4E4"))
                            .overlay(
                                Text("target_details_button_check", comment: "Bottom button to check photo")
                                    .foregroundColor(.black)
                            )
                    }
                    .frame( height: Layout.bottomButtonHeight, alignment: .center)
                    .shadow(radius: Layout.checkButtonShadowRadius)
                    .disabled(inputImage == nil || viewModel.target.isGuessed)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage, sourceType: $sourceType)
                    .onDisappear {
                        self.showingImagePicker = false
                    }
            }
            .padding(.horizontal, Layout.mainStackHPadding)
            .padding(.vertical)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ChallengeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ChallengeDetailViewModel()
        ChallengeDetailView(viewModel: model)
            .previewDevice("iPhone 12 Pro Max")
    }
}
