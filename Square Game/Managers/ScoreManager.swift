//
//  ScoreManager.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import Foundation

class ScoreManager: ObservableObject {
    @Published var scores: [Score] = []
    
    func addScore(name: String, points: Int) {
        let newScore = Score(name: name, points: points)
        scores.append(newScore)
        scores.sort { $0.points > $1.points } // Sort by highest score
    }
}
