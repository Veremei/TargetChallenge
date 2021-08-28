//
//  BaseCoordinator.swift
//  BaseCoordinator
//
//  Created by Daniil Veramei on 22.08.2021.
//

import SwiftUI

protocol CoordinatorProtocol: AnyObject {
    func build() -> AnyView
}
