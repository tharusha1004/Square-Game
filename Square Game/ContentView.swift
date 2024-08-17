//
//  ContentView.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var scoreManager: ScoreManager

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                // Game Logo
                Image(systemName: "square.grid.2x2.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                
                // Game Title
                Text("Square Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // New Game Button
                NavigationLink(destination: GameView()) {
                    Text("New Game")
                        .font(.title2)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
                
                Spacer()
                
                // User Guide Button
                NavigationLink(destination: UserGuideView()) {
                    Text("User Guide")
                        .font(.title2)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
                
                // Score Board Button
                NavigationLink(destination: ScoreBoardView()) {
                    Text("Score Board")
                        .font(.title2)
                        .frame(width: 250, height: 50)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ScoreManager()) // Inject the ScoreManager for the preview
    }
}


