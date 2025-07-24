//
//  AstronautView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 24/07/25.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(.white, lineWidth: 1)
                    )
                    .padding()
                Text(astronaut.description)
                    .padding(.horizontal)
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        // ! means force unwrap as its only preview code
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
