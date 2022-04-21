//
//  Model.swift
//  EaseeDemo
//
//  Created by Marco Wenzel on 19.04.22.
//

import Foundation
class Model: ObservableObject {
    static var preview = Model(locations: ChargeLocation.createPreviewContent())
    @Published var locations: [ChargeLocation]
    @Published var notifChargeStarted = true
    @Published var notifChargeEnded = true
    @Published var notifChargeInter = true
    @Published var notifAuthForgotten = true
    
    init(locations: [ChargeLocation] = []) {
        self.locations = locations
    }
}

struct ChargeLocation: Identifiable {
    var id = UUID()
    var name: String
    var robots: [ChargeRobot] = []
}

struct ChargeRobot: Identifiable {
    var id = UUID()
    var name: String
    var color = "white"
    var isCharging = false
    var isCableLocked = false
    var isAccessLocked = false
}

extension ChargeLocation {
    static var preview: ChargeLocation {
        let robot1 = ChargeRobot(name: "Garage 1")
        let robot2 = ChargeRobot(name: "Garage 2", color: "red")
        return ChargeLocation(name: "Home", robots: [robot1, robot2])
    }
    static func createPreviewContent() -> [ChargeLocation] {
        let robot1 = ChargeRobot(name: "Garage 1", color: "blue")
        let robot2 = ChargeRobot(name: "Garage 2", color: "white")
        let robot3 = ChargeRobot(name: "Carport", color: "red")
        let location1 = ChargeLocation(name: "Home", robots: [robot1, robot2])
        let location2 = ChargeLocation(name: "Cabin", robots: [robot3])
        return [location1, location2]
    }
}

extension ChargeRobot {
    static var preview: ChargeRobot {
        ChargeRobot(name: "Carport", color: "blue")
    }
}
