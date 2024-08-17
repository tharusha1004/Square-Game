//
//  ScoreBoardView.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import SwiftUI

struct ScoreBoardView: View {
    @EnvironmentObject var scoreManager: ScoreManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Score Board")
                .font(.largeTitle)
                .padding()

            List(scoreManager.scores) { score in
                HStack {
                    Text(score.name)
                    Spacer()
                    Text("\(score.points)")
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }
}

struct ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView()
            .environmentObject(ScoreManager()) // Ensure ScoreManager is injected for the preview
    }
}
