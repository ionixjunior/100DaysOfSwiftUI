//
//  Title.swift
//  GuessTheFlag
//
//  Created by Ione Souza Junior on 24/07/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.yellow)
    }
}
