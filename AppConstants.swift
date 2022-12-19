//
//  AppConstants.swift
//  Live Activities Test
//
//  Created by João Leite on 09/12/22.
//

import SwiftUI

enum AppConstants {
    
    enum Strings {
        static let carName = "Phantom"
        static let milesKey = "mi"
        static let energyKey = "kWh"
    }
    
    enum Images {
        static let carImage = Image("Car")
    }
    enum Gradients {
        static let backgroundGradient = LinearGradient(
            gradient: Gradient(colors: [.black , AppConstants.Colors.backgroundBrown]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    enum Colors {
        static let textColor = Color(red: 0.60, green: 0.60, blue: 0.60)
        static let backgroundBrown = Color(red: 0.25, green: 0.22, blue: 0.22)
    }
    
}
