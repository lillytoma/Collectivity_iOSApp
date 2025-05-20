//
//  RecordingRow.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/8/25.
//

import Foundation
import SwiftUI


//A view representing a signle recording row with playback feature and delete option
struct RecordingRow: View{
    let recording: Recording
    let isPlaying: Bool
    let onPlay: () -> Void
    let onDelete: () -> Void
    
    @State private var showAlert = false
    var body: some View {
        HStack{
            //Recording Info
            VStack(alignment: .leading, spacing: 5){
                Text("No. \(recording.sequence)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(recording.formattedDate)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            Spacer()
            
            Button{
                onPlay()
            }label: {
                Image(systemName: isPlaying ? "stop.fill" : "play.fill")
                    .font(.title2)
                    .foregroundColor(Color.white)
            }
            .buttonStyle(.plain)
            .padding(.trailing, 10)
            
            
            //Delete Button with Haptic Feedback
            
            Button{
                //Trigger Haptic Feedback
                let impactSoft = UIImpactFeedbackGenerator(style: .soft)
                impactSoft.impactOccurred()
                
                //Show confimation alert
                showAlert = true
            }label: {
                Image(systemName: "trash.fill")
                    .font(.title2)
                    .foregroundColor(.red)
            }
            .buttonStyle(.plain)
            .alert(isPresented: $showAlert){
                Alert(title: Text("Delete Recording"), message: Text("Are you sure you want to delete this recording?"), primaryButton: .destructive(Text("Delete ")){
                    onDelete()
                }, secondaryButton: .cancel())
            }
        }
        .padding()
    }
}
