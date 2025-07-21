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
    let mission: [Missions] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(mission) { mission in
                        NavigationLink{
                            Text("Detail view")
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
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            // this says that its always dark color theme
            .preferredColorScheme(.dark)
        }
//        NavigationStack{
//            List(0..<100){ row in
//                NavigationLink("Row \(row)"){
//                    Button("Decode JSON") {
//                        let input = """
//                        {
//                            "name": "Taylor Swift",
//                            "address": {
//                                "street": "555, Taylor Swift Avenue",
//                                "city": "Nashville"
//                            }
//                        }
//                        """
//                        let data = Data(input.utf8)
//                        let decoder = JSONDecoder()
//
//                        if let user = try? decoder.decode(User.self, from: data){
//                            print(user.address.street)
//                        }
//                    }
//                }
//            }
//            NavigationLink{
//                ScrollView1()
//            } label: {
//                VStack{
//                    Text("This is a line")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//                .navigationTitle("SwiftUI")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
