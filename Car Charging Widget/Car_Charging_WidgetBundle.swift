//
//  Car_Charging_WidgetBundle.swift
//  Car Charging Widget
//
//  Created by João Leite on 21/11/22.
//

import WidgetKit
import SwiftUI

@main
struct Car_Charging_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Car_Charging_Widget()
        Car_Charging_WidgetLiveActivity()
    }
}

struct Car_Charging_Widget: Widget {
    let kind: String = "Car_Charging_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: CarChargingProvider()) { entry in
            Car_Charging_WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Car Charging Widget")
        .description("Keep track of your car's charging status on your home screen.")
    }
}
