//
//  AstronautListView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 24/07/25.
//

import SwiftUI

struct AstronautListView: View {
    let crewMember: Astronaut
    let role: String
    var body: some View {
        HStack{
            Image(crewMember.id)
                .resizable()
                .scaledToFit()
                .frame(width: 102, height: 74)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 2)
                    
                )
            VStack(alignment: .leading){
                Text(crewMember.name)
                    .foregroundColor(.white)
                    .bold()
                Text(role)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AstronautListView_Previews: PreviewProvider {
    
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautListView(crewMember: astronauts["aldrin"]!, role: "Pilot")
            .preferredColorScheme(.dark)
    }
}
