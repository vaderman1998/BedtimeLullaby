import Foundation
import Combine

class SleepTimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 0
    @Published var isTimerRunning = false
    @Published var selectedSound: Sound?
    
    private var soundManager = SoundManager()
    private var timerCancellable: AnyCancellable?
    private var timer: Timer?
    
    func startTimer(minutes: Int) {
        guard !isTimerRunning else { return }
        
        remainingTime = TimeInterval(minutes * 60)
        isTimerRunning = true
        
        // Start playing the selected sound when timer starts
        if let sound = selectedSound {
            soundManager.playSound(sound)
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        soundManager.stopSound()
    }
    
    func selectSound(_ sound: Sound) {
        soundManager.stopSound()
        selectedSound = sound
        
        // Only play the sound if the timer is running
        if isTimerRunning {
            soundManager.playSound(sound)
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) % 3600 / 60
        let seconds = Int(time) % 60
        
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    deinit {
        stopTimer()
    }
} 