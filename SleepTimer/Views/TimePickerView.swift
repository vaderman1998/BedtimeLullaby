import SwiftUI

struct TimePickerView: View {
    @State private var selectedMinutes = 30
    let onConfirm: (Int) -> Void
    let onDismiss: () -> Void
    
    private let minutes = Array(1...120) // 1 to 120 minutes
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Set Timer Duration")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Picker("Minutes", selection: $selectedMinutes) {
                    ForEach(minutes, id: \.self) { minute in
                        Text("\(minute) min")
                            .tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 200)
                
                HStack(spacing: 20) {
                    Button("Cancel") {
                        onDismiss()
                    }
                    .font(.title3)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("Start Timer") {
                        onConfirm(selectedMinutes)
                    }
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
} 