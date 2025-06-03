import Foundation

struct Sound: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let fileName: String
    
    static let allSounds = [
        Sound(name: "Rain", fileName: "rain"),
        Sound(name: "Ocean Waves", fileName: "ocean"),
        Sound(name: "Forest", fileName: "forest"),
        Sound(name: "Lullaby 1", fileName: "lullaby1"),
        Sound(name: "Lullaby 2", fileName: "lullaby2"),
        Sound(name: "Toy Box", fileName: "toy_box")
    ]
} 