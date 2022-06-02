//
//  Extension+LinearGradient.swift
//  NetflixClone
//
//  Created by Raden Dimas on 18/05/22.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
