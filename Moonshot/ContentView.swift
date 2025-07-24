//
//  ContentView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 09/07/25.
//

import SwiftUI
struct CustomText:View{
    let text: String
    var body: some View{
        Text(text)
            .font(.title2)
    }

    init(text: String) {
        self.text = text
        print("Creating a custom text \(text)")
    }
}
//
//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}

struct ContentView: View {
    // we are defining it as dict of astonauts so that it knows what it load when we call it
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Missions] = Bundle.main.decode("missions.json")
    @State var showingGrid = true
    var body: some View{
        NavigationView{
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions, showingGrid: showingGrid)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar{
                Button{
                    showingGrid.toggle()
                } label: {
                    Text(showingGrid ? "View as List" : "View as Grid")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
