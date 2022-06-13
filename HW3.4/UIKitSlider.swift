//
//  UIKitSlider.swift
//  HW3.4
//
//  Created by Андрей Барсук on 13.06.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Double
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.onChange),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = UIColor(.green).withAlphaComponent(CGFloat(opacity / 100))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func onChange(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(sliderValue: .constant(50), opacity: 75)
    }
}
