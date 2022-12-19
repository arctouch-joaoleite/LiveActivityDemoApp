//
//  Car_Charging_WidgetLiveActivity.swift
//  Car Charging Widget
//
//  Created by João Leite on 21/11/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Car_Charging_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        
        ActivityConfiguration(for: Car_Charging_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            Car_Charging_WidgetEntryView(entry: CarChargingEntry(date: Date(),
                                                                 carName: context.attributes.carName,
                                                                 chargingStatus: context.state.chargingStatus,
                                                                 addedMiles: context.state.addedMiles,
                                                                 addedPower: context.state.addedPower)
            )
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    HStack() {
                        VStack(alignment: .leading) {
                                Text("\(context.attributes.carName)")
                                    .multilineTextAlignment(.center)
                                    .font(.title2)
                            Text("\(context.state.chargingStatus)")
                                .font(.body)
                                .foregroundColor(AppConstants.Colors.textColor)
                                .multilineTextAlignment(.center)
                                
                            
                        }
                        Spacer()
                        AppConstants.Images.carImage
                            .resizable()
                            .scaledToFit()
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    
                    VStack {
                        HStack(spacing: 20.0) {
                            Text("+\(context.state.addedMiles) mi")
                                .foregroundColor(AppConstants.Colors.textColor)
                                .font(.title3)
                            Text("\(context.state.addedPower) kWh")
                                .foregroundColor(AppConstants.Colors.textColor)
                                .font(.title3)
                        }
                    }
                    
                }
            } compactLeading: {
                Image(systemName: "car.fill")
            } compactTrailing: {
                Text("+\(context.state.addedMiles)mi")
            } minimal: {
                Image(systemName: "car.fill")
            }
            .keylineTint(AppConstants.Colors.backgroundBrown)
        }
    }
}
