//
//  Convert.swift
//  Checkpoint01
//
//  Created by Ione Souza Junior on 02/07/24.
//

import Foundation

struct Convert {
    static func celciusToFahrenheit(celcius: Decimal) -> Decimal {
        return (celcius * 9 / 5) + 32
    }
}
