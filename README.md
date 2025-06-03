# Sleep Timer iOS App

This is an iOS version of your Android Sleep Timer app, built with SwiftUI and following iOS design patterns.

## Features

- ⏰ **Customizable Timer**: Set sleep timer from 1 to 120 minutes
- 🎵 **Sleep Sounds**: Choose from 6 relaxing sounds:
  - Rain
  - Ocean Waves
  - Forest
  - Lullaby 1
  - Lullaby 2
  - Toy Box
- 🔄 **Looping Audio**: Sounds play continuously until timer ends
- 📱 **Native iOS UI**: Built with SwiftUI for a native iOS experience
- 🎨 **Beautiful Design**: Modern gradient background and clean interface

## Architecture

The app follows the MVVM (Model-View-ViewModel) pattern:

- **Models**: `Sound.swift` - Data structures
- **ViewModels**: `SleepTimerViewModel.swift` - Business logic and state management
- **Views**: `ContentView.swift`, `TimePickerView.swift` - UI components
- **Resources**: `SoundManager.swift` - Audio playback management

## Requirements

- iOS 17.2+
- Xcode 15.2+
- Swift 5.0+

## Setup Instructions

1. **Open the Project**:
   - Open `SleepTimer.xcodeproj` in Xcode

2. **Sound Files Already Included**:
   - All 6 sound files have been copied from your Android project:
     - `rain.mp3` (376KB)
     - `ocean.mp3` (1.5MB)
     - `forest.mp3` (1.7MB)
     - `lullaby1.mp3` (7.0MB)
     - `lullaby2.mp3` (7.3MB)
     - `toy_box.mp3` (518KB)

3. **Configure Signing**:
   - Select your development team in the project settings
   - Update the bundle identifier if needed

4. **Build and Run**:
   - Select your target device or simulator
   - Press Cmd+R to build and run

## Key Differences from Android Version

### Technology Stack
- **Android**: Kotlin + Jetpack Compose + MediaPlayer
- **iOS**: Swift + SwiftUI + AVAudioPlayer

### Audio Management
- **Android**: Uses MediaPlayer with context dependency
- **iOS**: Uses AVAudioPlayer with AVAudioSession configuration

### UI Framework
- **Android**: Jetpack Compose with Material Design 3
- **iOS**: SwiftUI with native iOS design patterns

### State Management
- **Android**: ViewModel with Compose state
- **iOS**: ObservableObject with @Published properties

## File Structure

```
SleepTimer/
├── SleepTimerApp.swift          # App entry point
├── Models/
│   └── Sound.swift              # Sound data model
├── ViewModels/
│   └── SleepTimerViewModel.swift # Business logic
├── Views/
│   ├── ContentView.swift        # Main UI
│   └── TimePickerView.swift     # Timer duration picker
├── Resources/
│   ├── SoundManager.swift       # Audio playback
│   └── Sounds/
│       ├── rain.mp3             # 376KB
│       ├── ocean.mp3            # 1.5MB
│       ├── forest.mp3           # 1.7MB
│       ├── lullaby1.mp3         # 7.0MB
│       ├── lullaby2.mp3         # 7.3MB
│       └── toy_box.mp3          # 518KB
└── Assets.xcassets/             # App icons and colors
```

## Usage

1. **Set Timer**: Tap "Set Timer" to choose duration (1-120 minutes)
2. **Select Sound**: Choose from the 6 available sleep sounds
3. **Start**: Confirm your timer duration to start
4. **Stop**: Tap "Stop Timer" to end early

## Audio Session Configuration

The app configures the audio session for:
- Background playback capability
- Proper audio category for sleep sounds
- Automatic audio session management

## Contributing

Feel free to contribute by:
- Adding new sound options
- Improving the UI/UX
- Adding new features like fade-out effects
- Optimizing performance

## License

This project is available for personal and educational use. 