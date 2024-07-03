import SwiftUI

struct ContentView: View {
    @State var celciusTemperature: String = ""
    @State var fahrenheitTemperature: Decimal? = nil

    var body: some View {
        VStack {
            Group {
                TextField("Type temperature in Celcius to convert", text: $celciusTemperature)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)

                Button("Convert to Fahrenheit") {
                    if let celcius = Decimal(string: celciusTemperature) {
                        fahrenheitTemperature = Convert.celciusToFahrenheit(celcius: celcius)
                    }
                }

                if let fahrenheitTemperature = fahrenheitTemperature,
                   let celcius = Decimal(string: celciusTemperature) {
                    Text("\(celcius)º Celcius is equivalent to \(fahrenheitTemperature) ºF")
                }
            }
            .padding()
        }
    }
}
