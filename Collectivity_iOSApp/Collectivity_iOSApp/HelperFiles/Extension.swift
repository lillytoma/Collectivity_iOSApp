//
//  Extension.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/8/25.
//

import Foundation
import SwiftUI

extension Notification.Name {
    static let playbackFinished = Notification.Name("playbackFinished")
}

extension PromptView {
    func getActivityColor(category: categories) -> Color {
        switch category{
        case .Communication:
            return .commC
        case .Empathy:
            return .empathyC
        case .Awareness:
            return .awareC
        }
    }
}
