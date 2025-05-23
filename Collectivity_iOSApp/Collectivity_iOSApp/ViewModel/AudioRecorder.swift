//
//  AudioRecorder.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/8/25.
//

import Foundation
import SwiftUI
import AVFoundation

// observable class responsible for handling audio recording and playback.
class AudioRecorder: NSObject, ObservableObject, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    @Published var recording: Recording?
   // @Published var recordings: [Recording] = [] //where we will store all our recordings (in an array)
    @Published var audioLevels: [CGFloat] = Array(repeating: 20, count: 30) // Init with default values
    
    private var audioRecorder: AVAudioRecorder? //this is used to do the "recording"
    private var audioPlayer: AVAudioPlayer? //this is useed to "play"
    
    let session: AVAudioSession = AVAudioSession.sharedInstance() //the current session that is activated

    
    // timer
    private var meterTimer: Timer?
    
    func playRecording(url: URL, completion: (Bool) -> Void) {
            do {
                try session.overrideOutputAudioPort(.speaker)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
                audioPlayer?.play()
                completion(true) //**understand this, its called in content view in function HandleActionPlay
            } catch {
                print("Playback failed: \(error.localizedDescription)")
                completion(false)
            }
    }

    // stop recording, this isnt implemented in content view or iskt working propelrly
    func stopPlayback() {
            audioPlayer?.stop()
            audioPlayer = nil
            
            // deactivate the audio session after stopping playback, let the audioSession be free and someone else can take it
            try? AVAudioSession.sharedInstance().setActive(false)
        }
    
    // starts recording audio
    func startRecording() {
        
       // let sequence = (recordings.last?.sequence ?? 0) + 1 //break this line down, if fileName isnt being used then so is this
        let formatter = DateFormatter() //to format the date
        formatter.dateFormat = "yyyyMMdd_HHmss" //**isnt being used most likely, or being stored somewhere in the backend
        let dateString = formatter.string(from: Date())
        //print(dateString) //is it why is it not printing anything
        let fileName = "Recording_\(dateString).m4a"
        
        // get the document directory path
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
//        
        // define audio recording settings
        let settings: [String: Any] = [ //**why is the "Any key word used here"
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), // aAC format
            AVSampleRateKey: 44100.0, // sample rate
            AVNumberOfChannelsKey: 2, // stereo
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            // initialize the audio recorder with the file path and settings
            audioRecorder = try AVAudioRecorder(url: path, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.record()
            
        } catch {
            print("Failure starting the recording: \(error.localizedDescription)")
        }
    }
    
    // ** this has an issue doesnt really STOP the recording
    func stopRecording() {
        audioRecorder?.stop() // stops the recording
        audioRecorder = nil // release the recorder
    }
    
    // fetches all recordings from the document directory
    func fetchRecordings() {
        // the document directory path
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        do {
            // get all files in the directory
            let files = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: [.creationDateKey], options: .skipsHiddenFiles)
            
            // map  the files to recording structs
            let fetchedRecordings = files.filter { $0.pathExtension == "m4a" }.compactMap { url -> Recording? in
                let attributes = try? FileManager.default.attributesOfItem(atPath: url.path)
                let creationDate = attributes?[.creationDate] as? Date ?? Date()
                
                // extract sequence number from filename
                let fileName = url.lastPathComponent
                let components = fileName.split(separator: "_")
                let sequence = components.count > 1 ? Int(components[1]) ?? 0 : 0
                
                return Recording(url: url, date: creationDate, sequence: sequence)
            }
            
            // sort recordings by sequence
            //recordings = fetchedRecordings.sorted(by: { $0.sequence < $1.sequence })
        } catch {
            // handle errors in fetching files
            print("Failed to fetch files \(error.localizedDescription)")
        }
    }
    
    // Delete a recording
    func deleteRecording(url: URL) {
        do {
            // Delete the file at the specified URL
            try FileManager.default.removeItem(at: url)
            
            // Update the recordings array by filtering out the deleted file
           // recordings.removeAll { $0.url == url }
            
            // Optionally, you can call fetchRecordings again to reload the list
            fetchRecordings()
        } catch {
            print("Failed to delete recording: \(error.localizedDescription)")
        }
    }
}
