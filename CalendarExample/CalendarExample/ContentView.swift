import SwiftUI

struct ContentView: View {
    @State private var outputText: String = "Tap a button to display calendar information"
    
    private let currentCalendar = Calendar.current
    private let autoupdatingCalendar = Calendar.autoupdatingCurrent
    
    var body: some View {
        VStack(spacing: 20) {
            Text(outputText)
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            
            Button(action: {
                displayCalendarInfo(from: currentCalendar)
            }) {
                Text("Show Current Calendar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                displayCalendarInfo(from: autoupdatingCalendar)
            }) {
                Text("Show Autoupdating Calendar")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    private func displayCalendarInfo(from calendar: Calendar) {
        let comps = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        
        // Formatting the time
        let time: (hour: Int, minute: Int) = (comps.hour ?? 0, comps.minute ?? 0)
        let hours = time.hour < 10 ? "0\(time.hour)" : "\(time.hour)"
        let minutes = time.minute < 10 ? "0\(time.minute)" : "\(time.minute)"
        
        // Creating output
        var output = "Calendar: \(calendar.identifier)\n"
        output += "Time Zone: \(calendar.timeZone.identifier)\n"
        output += "\(hours):\(minutes)"
        
        // Update the output text
        outputText = output
    }
}

#Preview {
    ContentView()
}
