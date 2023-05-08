//
//  Mission.swift
//  Moonshot
//
//  Created by EDSON FELIPE VASCONCELOS on 25/04/23.
//

import Foundation
import SwiftUI

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLaunchDateMission: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
    
    var crewList: String {
        return crew.map { $0.name.capitalizingFirstLetter() }.joined(separator: ", ")
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
