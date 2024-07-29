//
//  ContentView.swift
//  BetterRest
//
//  Created by Ione Souza Junior on 26/07/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""


    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: Binding(get: {
                        self.wakeUp
                    }, set: { newValue in
                        self.wakeUp = newValue
                        self.calculateBedtime()
                    }), displayedComponents: .hourAndMinute)
                }

                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: Binding(get: {
                        self.sleepAmount
                    }, set: { newValue in
                        self.sleepAmount = newValue
                        self.calculateBedtime()
                    }), in: 4...12, step: 0.25)
                }

                Section("Daily coffee intake") {
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)

                    Picker("Total of cups", selection: Binding(get: {
                        self.coffeeAmount
                    }, set: { newValue in
                        self.coffeeAmount = newValue
                        self.calculateBedtime()
                    })) {
                        ForEach(1...20, id: \.self) { cups in
                            Text("\(cups)")
                        }
                    }
                }

                if !alertTitle.isEmpty {
                    Text("\(alertTitle)\n\(alertMessage)")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("BetterRest")
        }
    }

    private func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep

            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
}

#Preview {
    ContentView()
}
