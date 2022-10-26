//
//  ContentView.swift
//  KittyCatBatteryLife
//
//  Created by Miguel Garcia on 10/25/22.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryStateCatFeeling: String = ""
    @Published var batteryStateCat: Color = .mint
    
    init () {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        setBatteryState()
        
        //notifications observers
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange(notification:)), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange(notification:)), name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    

    @objc func batteryLevelDidChange(notification: Notification) {
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
    }
    
    @objc func batteryStateDidChange(notification: Notification) {
        setBatteryState()
    }
    
    private func setBatteryState() {
        let batteryState = UIDevice.current.batteryState
        self.batteryStateCat = getBatteryStateCat(for: batteryState)
        self.batteryStateCatFeeling = getBatteryCatFeeling(for: batteryState)
    }
    
    private func getBatteryStateCat(for state: UIDevice.BatteryState) -> Color{
        switch state {
        case .charging:
            return .green
            
        case .full:
            return .blue
        
        case .unplugged:
            return .gray
            
        case .unknown:
            return .mint
            
        @unknown default:
            return .mint
        }
    }
    
    private func getBatteryCatFeeling(for state: UIDevice.BatteryState) -> String{
        switch state{
        case .charging:
            return "resting kitty cat"
            
        case .full:
            return "full kitty cat"
        
        case .unplugged:
            return "out on the town kitty cat"
        
        case .unknown:
            return "who knows where the cat is?"
        
        @unknown default:
            return "who knows where the cat is?"
        }
    }
    
}


struct ContentView: View {
    
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Battery level: \(batteryViewModel.batteryLevel)%")
            Text("Battery state: \(batteryViewModel.batteryStateCatFeeling)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(batteryViewModel.batteryStateCat)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
