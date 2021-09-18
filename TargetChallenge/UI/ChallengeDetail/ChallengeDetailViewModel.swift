//
//  ChallengeDetailViewModel.swift
//  ChallengeDetailViewModel
//
//  Created by Daniil Veramei on 26.08.2021.
//

import SwiftUI
import CoreML
import Vision
import Foundation

class ChallengeDetailViewModel: ObservableObject {
    
    @Published var target: Target
    
    private(set) var results: String?
    
    private lazy var classificationRequest: VNCoreMLRequest = {
        do {

            let model = try VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model)

            let request = VNCoreMLRequest(model: model) { [weak self] request, error in
                guard let self = self else {
                    return
                }
                self.processClassifications(for: request, error: error)
            }

            request.imageCropAndScaleOption = .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    init(target: Target = Target.mockData[0]) {
        self.target = target
    }
    
    func classifyImage(_ image: UIImage) {
        guard let orientation = CGImagePropertyOrientation(
            rawValue: UInt32(image.imageOrientation.rawValue)) else {
                return
            }
        guard let ciImage = CIImage(image: image) else {
            fatalError("Unable to create \(CIImage.self) from \(image).")
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler =
            VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            do {
                try handler.perform([self.classificationRequest])
            } catch {
                print("Failed to perform classification.\n\(error.localizedDescription)")
            }
        }
    }
    
    private func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            if let classifications =
                request.results as? [VNClassificationObservation] {
                let topClassifications = classifications.prefix(5)
                let a = Set(self.target.modelLabels)
                let b = Set(topClassifications.map { $0.identifier })
                
                if !a.intersection(b).isEmpty {
                    self.target.isGuessed = true
                }
            }
        }
    }
}
