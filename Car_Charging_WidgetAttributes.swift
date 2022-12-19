//
//  Car_Charging_WidgetAttributes.swift
//  Live Activities Test
//
//  Created by João Leite on 24/11/22.
//

import Foundation
import ActivityKit

struct Car_Charging_WidgetAttributes: ActivityAttributes {
    
    // Values that will not change thoughout the activity
    var carName: String
    
    public struct ContentState: Codable, Hashable {
        // Dynamically updated values
        var chargingStatus: String
        var addedMiles: Int
        var addedPower: Int
    }
}
