//
//  MissionView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 21/07/25.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember{
        
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Missions
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                GeometryReader { geometry in
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    // this is ios15+
//            .containerRelativeFrame(.horizontal) { width, axis in
//                  width * 0.6
//            }
                }
                .frame(height: 200)
                .padding(.vertical)
                
                VStack(alignment: .leading){
                    // this is a custom divider
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        
                    Text(mission.description)
                
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink{
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 102, height: 74)
                                    .clipShape(RoundedRectangle(cornerRadius: 40))
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 2)
                                        
                                    )
                                VStack(alignment: .leading){
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .bold()
                                    Text(crewMember.role)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Missions, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = self.mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else{
                fatalError("Missing member data")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
