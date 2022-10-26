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
UIDevice.current.isBatteryMonitoringEnabled = true;
class BatteryView: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryDescriptionState: String = " "
    @Published var batteryStateCat: Color = .gray
    
    init () {
        UIDevice.current.isBatteryMonitoringEnabled = True
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
    }
    
    private func setBatteryState() {
        let batteryState = UIDevice.current.batteryState
    }
    
    private func getBatteryCat(for state: UIDevice.BatteryState) -> Cat{
        switch state {
            case
        }
    }
    
}

@main
struct KittyCatBatteryLifeApp: App {
    var batteryLevel: Float { UIDevice.current.batteryLevel };
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
