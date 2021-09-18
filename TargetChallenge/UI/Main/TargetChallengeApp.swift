//
//  TargetChallengeApp.swift
//  TargetChallenge
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

@main
struct TargetChallengeApp: App {
    let mainCoordinator = MainViewCoordinator()
    
    var body: some Scene {
        WindowGroup {
            mainCoordinator.build()
        }
    }
}
