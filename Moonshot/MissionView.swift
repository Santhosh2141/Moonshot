//
//  MissionView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 21/07/25.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Missions
    
    var body: some View {
        ScrollView{
            VStack{
                GeometryReader { geometry in
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        .padding(.top)
                    // this is ios15+
//                        .containerRelativeFrame(.horizontal) { width, axis in
//                                                width * 0.6
//                                            }
                }
                .frame(height: 200)
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decode("missions.json")
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}
