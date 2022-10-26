//
//  KittyCatBatteryLifeApp.swift
//  KittyCatBatteryLife
//
//  Created by Miguel Garcia on 10/25/22.
//

import SwiftUI
import WidgetKit

//WidgetCenter.shared.reloadTimelines(ofKind: "com.mybattery.widget")
//ALSO
//reload when user screen is tapped



@main
struct KittyCatBatteryLifeApp: App {
    var batteryLevel: Float { UIDevice.current.batteryLevel };
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
