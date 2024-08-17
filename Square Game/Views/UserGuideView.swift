//
//  UserGuideView.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import SwiftUI

struct UserGuideView: View {
    var body: some View {
        VStack {
            Text("User Guide")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            Text("Instructions:")
                .font(.title2)
                .fontWeight(.bold)
        .padding()
            
            Spacer()

        Text("1. Select the proper grid size.\n2. Click the same color twice to score points.\n3. If you click two different colors, the game ends.")
                .font(.body)
                .padding()
                .multilineTextAlignment(.center)
        }
    }
}

struct UserGuideView_Previews: PreviewProvider {
    static var previews: some View {
        UserGuideView()
    }
}
