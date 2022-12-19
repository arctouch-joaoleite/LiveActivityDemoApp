//
//  LiveActivityManagerView.swift
//  Live Activities Test
//
//  Created by João Leite on 08/11/22.
//

import SwiftUI
import ActivityKit

struct LiveActivityManagerView: View {
    
    var body: some View {
        ZStack {
            AppConstants.Gradients.backgroundGradient
                .edgesIgnoringSafeArea([.top, .bottom])
            
            VStack {
                Spacer()
                Text(AppConstants.Strings.carName)
                    .foregroundColor(AppConstants.Colors.textColor)
                    .font(.title)
                Spacer()
                    .frame(height: 50.0)
                AppConstants.Images.carImage
                    .resizable()
                    .scaledToFit()
                
                HStack(spacing: 20.0) {
                    Text("18 mi/min")
                        .foregroundColor(AppConstants.Colors.textColor)
                        .font(.title3)
                    Text("+62 mi")
                        .foregroundColor(AppConstants.Colors.textColor)
                        .font(.title3)
                    Text("251 kWh")
                        .foregroundColor(AppConstants.Colors.textColor)
                        .font(.title3)
                }
                
                Spacer()
                Button {
                    ChargingLiveActivityManager.instance.startLiveActivity()
                } label: {
                    Text("Pin to lock screen")
                        .font(.title2)
                        .foregroundColor(AppConstants.Colors.textColor)
                        .frame(maxWidth: .infinity)
                        
                        .padding()
                }
                .border(AppConstants.Colors.textColor, width: 3.0)
                
                Button {
                    ChargingLiveActivityManager.instance.stopLiveActivity()
                } label: {
                    Text("Stop charging")
                        .font(.title2)
                        .foregroundColor(AppConstants.Colors.textColor)
                        .frame(maxWidth: .infinity)
                        
                        .padding()
                }
                .border(AppConstants.Colors.textColor, width: 3.0)
                
                Button {
                    ChargingLiveActivityManager.instance.updateLiveActivity()
                } label: {
                    Text("Set charging limit")
                        .font(Font.title2)
                        .foregroundColor(AppConstants.Colors.textColor)
                        .frame(maxWidth: .infinity)
                        
                        .padding()
                }
                .border(AppConstants.Colors.textColor, width: 3.0)
                
            }
            .padding()
        }
    }
}

struct LiveActivityManagerView_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityManagerView()
    }
}
