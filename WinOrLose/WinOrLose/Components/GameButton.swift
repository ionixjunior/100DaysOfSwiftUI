//
//  GameButton.swift
//  WinOrLose
//
//  Created by Ione Souza Junior on 25/07/24.
//

import SwiftUI

struct GameButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(text) {
            action()
        }
        .font(.system(size: 80))
    }
}

#Preview {
    GameButton(text: "🪨") {
        print("tapped")
    }
}
