//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Ione Souza Junior on 24/07/24.
//

import SwiftUI

struct FlagImage: View {
    let flag: String

    var body: some View {
        Image(flag)
            .clipShape(Capsule())
    }
}

#Preview {
    FlagImage(flag: "Spain")
}
