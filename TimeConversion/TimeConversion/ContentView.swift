//
//  ContentView.swift
//  TimeConversion
//
//  Created by Ione Souza Junior on 19/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var unitFrom = Unit.seconds
    @State private var unitTo = Unit.minutes

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Choose the unit from", selection: $unitFrom) {
                        ForEach(Unit.allCases) { unit in
                            Text(unit.rawValue.capitalized)
                                .tag(unit)
                        }
                    }

                    Picker("Choose the unit to", selection: $unitTo) {
                        ForEach(Unit.allCases) { unit in
                            Text(unit.rawValue.capitalized)
                                .tag(unit)
                        }
                    }
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
