//
//  GameView.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import SwiftUI

struct GameView: View {
    @State private var selectedGridSize: Int = 3
    @State private var colors: [Color] = [.blue, .red, .green]
    @State private var gridColors: [Color] = []
    @State private var firstSelectionIndex: Int? = nil
    @State private var score: Int = 0
    @State private var showingGameOver = false
    @State private var showingNameInput = false
    @State private var playerName: String = ""

    @EnvironmentObject var scoreManager: ScoreManager
    
    var body: some View {
        VStack(spacing: 20) {
            // Game Logo
            Image(systemName: "square.grid.2x2.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            // Game Title
            Text("Square Game")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Grid Size Selection Buttons
            HStack {
                Button(action: {
                    selectGridSize(2)
                }) {
                    Text("2 x 2")
                        .frame(width: 60, height: 40)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
                
                Button(action: {
                    selectGridSize(3)
                }) {
                    Text("3 x 3")
                        .frame(width: 60, height: 40)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
                
                Button(action: {
                    selectGridSize(4)
                }) {
                    Text("4 x 4")
                        .frame(width: 60, height: 40)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                }
            }
            
            // Display the Grid
            let columns = Array(repeating: GridItem(.flexible()), count: selectedGridSize)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<gridColors.count, id: \.self) { index in
                    Rectangle()
                        .fill(gridColors[index])
                        .frame(height: 100)
                        .onTapGesture {
                            handleGridTap(index: index)
                        }
                }
            }
            .padding(.top, 20)
            
            // Back to Home Button
            Button(action: {
                showingGameOver = true
            }) {
                Text("Back to Home")
                    .frame(width: 250, height: 50)
                    .background(Color.white)
                    .foregroundColor(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 2)
                    )
            }
        }
        .padding()
        .alert(isPresented: $showingGameOver) {
            Alert(
                title: Text("Game Over"),
                message: Text("Score: \(score)"),
                dismissButton: .default(Text("Enter Name"), action: {
                    showingNameInput = true
                })
            )
        }
        .sheet(isPresented: $showingNameInput) {
            VStack {
                Text("Enter Your Name")
                    .font(.title)
                    .padding()
                
                TextField("Name", text: $playerName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save Score") {
                    scoreManager.addScore(name: playerName, points: score)
                    showingNameInput = false
                }
                .frame(width: 150, height: 50)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
            .padding()
        }
        .onAppear {
            selectGridSize(selectedGridSize)
        }
    }
    
    private func selectGridSize(_ size: Int) {
        selectedGridSize = size
        updateGridColors()
    }
    
    private func updateGridColors() {
        switch selectedGridSize {
        case 2:
            colors = [.blue, .red]
        case 3:
            colors = [.blue, .red, .green]
        case 4:
            colors = [.blue, .red, .green, .yellow]
        default:
            colors = [.blue, .red, .green]
        }
        
        gridColors = Array(repeating: colors, count: selectedGridSize * selectedGridSize / colors.count).flatMap { $0 }.shuffled()
    }
    
    private func handleGridTap(index: Int) {
        if let firstIndex = firstSelectionIndex {
            if gridColors[firstIndex] == gridColors[index] {
                score += 1
                updateGridColors() // Shuffle colors after scoring
            } else {
                showingGameOver = true // Game over if different colors are selected
            }
            firstSelectionIndex = nil
        } else {
            firstSelectionIndex = index
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(ScoreManager())
    }
}
