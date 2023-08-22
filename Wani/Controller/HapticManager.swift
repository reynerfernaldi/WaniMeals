//
//  HapticManager.swift
//  Wani
//
//  Created by Aiffah Kiysa Waafi on 22/08/23.
//

import Foundation
import CoreHaptics

class HapticManager {
    var hapticEngine: CHHapticEngine
    
    init?() {
      do {
        hapticEngine = try CHHapticEngine()
      } catch let error {
        print("Haptic engine Creation Error: \(error)")
        return nil
      }

      hapticEngine.isAutoShutdownEnabled = true
    
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }

        do {
            hapticEngine = try CHHapticEngine()
            try hapticEngine.start()
            print("yyyyyy")
        } catch {
            print("there was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func doneSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 15)
        events.append(event)
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticEngine.makePlayer (with: pattern)
            try player.start (atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
}
