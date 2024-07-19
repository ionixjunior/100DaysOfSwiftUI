//
//  Unit.swift
//  TimeConversion
//
//  Created by Ione Souza Junior on 19/07/24.
//

enum Unit: String, Identifiable, CaseIterable {
    case seconds, minutes, hours, days

    var id: String {
        self.rawValue
    }
}
