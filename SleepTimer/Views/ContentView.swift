import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SleepTimerViewModel()
    @State private var showTimePicker = false
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Timer Display
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 200, height: 200)
                    
                    Circle()
                        .stroke(Color.blue, lineWidth: 4)
                        .frame(width: 200, height: 200)
                    
                    Text(viewModel.formatTime(viewModel.remainingTime))
                        .font(.system(size: 36, weight: .bold, design: .monospaced))
                        .foregroundColor(.primary)
                }
                .padding(.top, 20)
                
                // Timer Controls
                HStack(spacing: 20) {
                    if !viewModel.isTimerRunning {
                        Button(action: {
                            showTimePicker = true
                        }) {
                            HStack {
                                Image(systemName: "timer")
                                Text("Set Timer")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(25)
                        }
                    } else {
                        Button(action: {
                            viewModel.stopTimer()
                        }) {
                            HStack {
                                Image(systemName: "stop.fill")
                                Text("Stop Timer")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(25)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Sound Selection
                VStack(alignment: .leading, spacing: 16) {
                    Text("Sleep Sounds")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(Sound.allSounds) { sound in
                                SoundRowView(
                                    sound: sound,
                                    isSelected: sound == viewModel.selectedSound,
                                    onSelect: {
                                        viewModel.selectSound(sound)
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
        .sheet(isPresented: $showTimePicker) {
            TimePickerView(
                onConfirm: { minutes in
                    viewModel.startTimer(minutes: minutes)
                    showTimePicker = false
                },
                onDismiss: {
                    showTimePicker = false
                }
            )
        }
    }
}

struct SoundRowView: View {
    let sound: Sound
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            HStack {
                HStack(spacing: 12) {
                    Image(systemName: isSelected ? "speaker.wave.2.fill" : "speaker.slash.fill")
                        .foregroundColor(isSelected ? .blue : .gray)
                        .font(.title3)
                    
                    Text(sound.name)
                        .font(.title3)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.blue.opacity(0.1) : Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 