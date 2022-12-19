//
//  Car_Charging_Widget.swift
//  Car Charging Widget
//
//  Created by João Leite on 21/11/22.
//

import WidgetKit
import SwiftUI
import Intents

struct CarChargingProvider: IntentTimelineProvider {
    private var defaultEntry = CarChargingEntry(
        date: Date(),
        carName: AppConstants.Strings.carName,
        chargingStatus: "Charging",
        addedMiles: 128,
        addedPower: 37)
    
    func placeholder(in context: Context) -> CarChargingEntry {
        defaultEntry
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (CarChargingEntry) -> ()) {
        completion(defaultEntry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<CarChargingEntry>) -> ()) {
        var entries: [CarChargingEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = CarChargingEntry(date: entryDate,
                                         carName: AppConstants.Strings.carName,
                                         chargingStatus: "Charging",
                                         addedMiles: 30 * hourOffset,
                                         addedPower: 47)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct CarChargingEntry: TimelineEntry {
    var date: Date
    
    var carName: String
    var chargingStatus: String
    var addedMiles: Int
    var addedPower: Int
}

struct Car_Charging_WidgetEntryView : View {
    var entry: CarChargingEntry
    
    var body: some View {
        VStack(alignment: .center){
            HStack {
                Text(entry.carName)
                    .foregroundColor(AppConstants.Colors.textColor)
                Spacer()
                Text(entry.chargingStatus)
                    .foregroundColor(AppConstants.Colors.textColor)
            }
             
            
            AppConstants.Images.carImage
                .resizable()
                .frame(width: 200)
            
            
            HStack() {
                Spacer()
                Text("+\(entry.addedMiles)")
                    .foregroundColor(AppConstants.Colors.textColor)
                Text(AppConstants.Strings.milesKey)
                    .foregroundColor(AppConstants.Colors.textColor)
                    .opacity(0.6)
                
                Spacer()
                    .frame(width: 30.0)
                
                Text("+\(entry.addedPower)")
                    .foregroundColor(AppConstants.Colors.textColor)
                Text(AppConstants.Strings.energyKey)
                    .foregroundColor(AppConstants.Colors.textColor)
                    .opacity(0.6)
                Spacer()
            }
        }
        .padding()
        .background(
            AppConstants.Gradients.backgroundGradient
        )
        
    }
}

struct Car_Charging_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Car_Charging_WidgetEntryView(entry: CarChargingEntry(
            date: Date(),
            carName: AppConstants.Strings.carName,
            chargingStatus: "Charging",
            addedMiles: 128,
            addedPower: 37)
        )
        .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
