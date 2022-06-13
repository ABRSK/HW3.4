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
    
    var body: some View {
        VStack {
            Text("Get as close a possible to: \(targetValue)")
            HStack {
                Text("  0")
                Slider(value: $currentValue, in: 0...100, step: 1)
                    .tint(.green)
                Text("100")
            }
            UIKitSlider(sliderValue: $currentValue, opacity: computeScore())
            Text("\(currentValue)")
            Text("\(computeScore())")
            Color(.green)
                .frame(width: 100, height: 100)
                .opacity(Double(computeScore()) / 100)
            Button("Get Score") {
                // Alert with result
            }
            Button("New Value") {
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
