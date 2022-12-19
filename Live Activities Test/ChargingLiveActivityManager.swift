//
//  ChargingLiveActivityManager.swift
//  Live Activities Test
//
//  Created by João Leite on 09/12/22.
//

import Foundation
import ActivityKit
import Combine

class ChargingLiveActivityManager {
    
    static var instance: ChargingLiveActivityManager {
        ChargingLiveActivityManager()
    }
    
    func startLiveActivity() {
        let activityAttributes = Car_Charging_WidgetAttributes(carName: "Phantom")

        do {
            let chargingActivity = try Activity.request(
                attributes: activityAttributes,
                contentState: Car_Charging_WidgetAttributes.ContentState(chargingStatus: "Charging",
                                                                         addedMiles: 62,
                                                                         addedPower: 251),
                pushType: .token
            )
            
            Task {
                for await pushTokenData in chargingActivity.pushTokenUpdates {
                    let activityTokenString = pushTokenData.reduce("", {$0 + String(format: "%02X", $1)})
                    print("Live activity token: \(activityTokenString )")
                }
            }
            

        } catch (let error) {
            print("Error requesting charging Live Activity \(error.localizedDescription).")
        }
    }

    func updateLiveActivity() {

        for activity in Activity<Car_Charging_WidgetAttributes>.activities {
            let contentState = Car_Charging_WidgetAttributes.ContentState(chargingStatus: "Charging",
                                                                     addedMiles: 62 + 37,
                                                                     addedPower: 47)

            let alertConfiguration = AlertConfiguration(
                title: "Charging Update",
                body: LocalizedStringResource(stringLiteral: "Phantom's battery update"),
                sound: .default
            )

            Task {
                await activity.update(using: contentState, alertConfiguration: alertConfiguration)
            }
        }
        
    }
    
    func stopLiveActivity() {
        for activity in Activity<Car_Charging_WidgetAttributes>.activities {
            Task {
                await activity.end(using: Car_Charging_WidgetAttributes.ContentState(chargingStatus: "Charging Completed",
                                                                                              addedMiles: 217,
                                                                                              addedPower: 251),
                                   dismissalPolicy: .default)
            }
        }
    }
}
