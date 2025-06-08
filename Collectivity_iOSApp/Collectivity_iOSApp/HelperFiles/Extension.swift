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

//extension RecordJournalView{
//    private func handlePlayAction(for recording: Recording) {
//        if currentlyPlaying == recording.url {
//            audioRecorder.stopRecording()
//            currentlyPlaying = nil
//        } else {
//            audioRecorder.playRecording(url: recording.url) { success in
//                if success {
//                    currentlyPlaying = recording.url
//                }
//            }
//        }
//    }
//    
//    private func handleDeleteAction(for recording: Recording) {
//        audioRecorder.deleteRecording(url: recording.url)
//    }
//}
