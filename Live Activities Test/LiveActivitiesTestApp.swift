//
//  LiveActivitiesTestApp.swift
//  Live Activities Test
//
//  Created by João Leite on 08/11/22.
//

import SwiftUI

@main
struct LiveActivitiesTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LiveActivityManagerView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert,.sound]) { (didAllow, error) in
            
        }
        
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("App push token: \(deviceTokenString)")
    }
    
}
