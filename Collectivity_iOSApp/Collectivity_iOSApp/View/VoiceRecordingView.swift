//
//  VoiceRecordingView.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/8/25.
//

import SwiftUI

struct VoiceRecordingView: View {
    @StateObject private var audioRecorder = AudioRecorder()
    @State private var isRecording = false
    @State private var currentlyPlaying: URL? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 30) {
                
                Text("Audio Recorder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                // record Button
                RecordButton(isRecording: $isRecording, audioRecorder: audioRecorder)

                // rec list
                Text("Recordings")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(audioRecorder.recordings) { recording in
                            RecordingRowView(
                                recording: recording,
                                isPlaying: currentlyPlaying == recording.url,
                                onPlay: {
                                    handlePlayAction(for: recording)
                                },
                                onDelete: {
                                    handleDeleteAction(for: recording)
                                }
                            )
                            .background(currentlyPlaying == recording.url ? Color.blue : Color.gray.opacity(0.5))
                            .cornerRadius(10)
                            .transition(.slide)
                            .animation(.easeInOut, value: audioRecorder.recordings)
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
        .onAppear {
            audioRecorder.fetchRecordings()
        }
        .onReceive(NotificationCenter.default.publisher(for: .playbackFinished)) { _ in
            currentlyPlaying = nil
        }
    }
    //handles play action
    private func handlePlayAction(for recording: Recording) {
        if currentlyPlaying == recording.url {
            audioRecorder.stopRecording()
            currentlyPlaying = nil
        } else {
            audioRecorder.playRecording(url: recording.url) { success in
                if success {
                    currentlyPlaying = recording.url
                }
            }
        }
    }
    
    private func handleDeleteAction(for recording: Recording) {
        audioRecorder.deleteRecording(url: recording.url)
    }
}

struct RecordButton: View {
    @Binding var isRecording: Bool
    var audioRecorder: AudioRecorder
    
    var body: some View {
        Button {
            // toggle Recording state
            isRecording.toggle()
            
            // trigger Haptic Feedback
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            
            if isRecording {
                audioRecorder.startRecording()
            } else {
                audioRecorder.stopRecording()
                audioRecorder.stopPlayback()
                audioRecorder.fetchRecordings()
            }
        } label: {
            ZStack {
                Circle()
                    .fill(isRecording ? Color.red : Color.green)
                    .frame(width: 50, height: 50)
                Image(systemName: isRecording ? "stop.fill" : "mic.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
            }
            .scaleEffect(isRecording ? 1.1 : 1.0)
            .animation(.spring(), value: isRecording)
        }
    }
}

struct RecordingRowView: View {
    var recording: Recording
    var isPlaying: Bool
    var onPlay: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        RecordingRow(
            recording: recording,
            isPlaying: isPlaying,
            onPlay: onPlay,
            onDelete: onDelete
        )
    }
}



#Preview {
    VoiceRecordingView()
}
