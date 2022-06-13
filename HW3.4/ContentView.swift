//
//  ContentView.swift
//  HW3.4
//
//  Created by Андрей Барсук on 13.06.2022.
//

import SwiftUI


struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack {
            Text("Get as close as possible to: \(targetValue)")
            HStack {
                Text("  0")
                UIKitSlider(sliderValue: $currentValue, opacity: computeScore())
                Text("100")
            }
            .padding(.vertical)
            Button("Get Score") {
                alertIsPresented = true
            }
            .alert(
                "Your Score", isPresented: $alertIsPresented, actions: {}) {
                    Text("\(computeScore())")
                }
                .padding(.bottom)
            Button("New Target") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
