//
//  RecordJournalView.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/27/25.
//


import SwiftUI
import Foundation

struct RecordJournalView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isTyping = false
    @State private var isRecording = false
    @State private var typedText = ""
    @State private var hasRecording = false
    @State private var recordingDuration = 55
    @State private var recordingDate = Date()

    var prompt: Prompt
    var color: Color?

    var body: some View {
        VStack {
            VStack(spacing: 4) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                    }
                    Spacer()
                }

                Text(prompt.category.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(prompt.name)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(color ?? Color.purple.opacity(0.15))
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 40, height: 5)
                .padding(.top, 6)
            HStack {
                Spacer()
                Button(action: {
                    isTyping.toggle()
                    isRecording = false
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .padding(.trailing)
                }
            }
            if let journalReflection = prompt.infoArray.filter({$0.nameOfCategory == .journalReflection}).first {
                Text("\(journalReflection.descriptionOfCategory)")
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.bottom)
                }
            Spacer()

            if isTyping {
                TextEditor(text: $typedText)
                    .padding()
                    .frame(height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                    .padding()
            } else if hasRecording {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(prompt.name)
                            .fontWeight(.medium)
                        Spacer()
                        Text(durationFormatted())
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Text(dateFormatted())
                            .foregroundColor(.gray)
                        Spacer()
                        Button(action: {
                        }) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.blue)
                        }

                        Button(action: {
                            hasRecording = false
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple.opacity(0.4), lineWidth: 1)
                )
                .padding(.horizontal)
            } else {
                Button(action: {
                    isRecording.toggle()
                    if isRecording == false {
                        hasRecording = true
                        recordingDate = Date()
                        recordingDuration = 55
                    }
                }) {
                    VStack(spacing: 8) {
                        Image(systemName: isRecording ? "mic.fill" : "mic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isRecording ? .red : .blue)

                        Text(isRecording ? "Recording..." : "Record")
                            .foregroundColor(isRecording ? .red : .blue)
                            .font(.headline)
                    }
                }
            }

            Spacer()
            Button{}
            label:{
                Text("Save Journal")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(color ?? Color.purple.opacity(0.3))
                    .foregroundColor(.black)
                    .font(.headline)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
        }
    }
    
    
    //the date formatters..
    func durationFormatted() -> String {
        let minutes = recordingDuration / 60
        let seconds = recordingDuration % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    func dateFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: recordingDate).uppercased()
    }
}



#Preview {
    RecordJournalView(prompt: PromptsInformation[0])
}
