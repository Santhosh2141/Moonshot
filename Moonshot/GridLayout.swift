//
//  GridLayout.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 25/07/25.
//

import SwiftUI

struct GridLayout: View {
   
    let astronauts: [String: Astronaut]
    let missions: [Missions]
    @State var showingGrid: Bool
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var toggleView = false
    var body: some View {
        // not adding navStack here cuz, in contentView we have navLink so when that is called the title gets added there instead of adding 2 titles
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
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
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot as Grid")
            .background(.darkBackground)
            // this says that its always dark color theme
            .preferredColorScheme(.dark)
    }
}

struct GridLayout_Previews: PreviewProvider {
    static let missions: [Missions] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        GridLayout(astronauts: astronauts, missions: missions, showingGrid: true)
            .preferredColorScheme(.dark)
    }
}
