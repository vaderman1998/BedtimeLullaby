import Foundation
import AVFoundation

class SoundManager: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    init() {
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
    }
    
    func playSound(_ sound: Sound) {
        guard let url = Bundle.main.url(forResource: sound.fileName, withExtension: "mp3") else {
            print("Could not find audio file: \(sound.fileName).mp3")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Error playing sound: \(error)")
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }
    
    deinit {
        stopSound()
    }
} 