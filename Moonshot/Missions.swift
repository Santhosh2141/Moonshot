//
//  Missions.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 21/07/25.
//

import Foundation



struct Missions: Codable, Identifiable, Hashable {
    // this is caled nested structs
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var imageName: String{
        "apollo\(id)"
    }
    // were passing this, as if we call launch date then we cant print "NA"
    var formattedLaunchDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    var formattedLaunchDateDetailed: String{
        launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
}
