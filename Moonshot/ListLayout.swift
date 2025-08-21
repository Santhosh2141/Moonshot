//
//  ListLayout.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 25/07/25.
//

import SwiftUI

struct ListLayout: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Missions]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(missions) { mission in
                    NavigationLink(value: mission){
                        HStack{
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack{
                                Text(mission.displayName)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                                Text(mission.formattedLaunchDate)
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    .navigationDestination(for: Missions.self){ mission in
                        MissionView(mission: mission, astronauts: astronauts)
                    }
                    
                }
                // makes the background of the listItem
                .listRowBackground(Color.darkBackground)
            }
            //It removes the default grouped/sectioned styling of a List, especially on iOS (which normally applies insets, background colors, and spacing between sections). It gives a clean, flat appearance, similar to the basic table view in UIKit.
            .listStyle(.plain)
            .navigationTitle("MoonShot as List")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
    }
}
