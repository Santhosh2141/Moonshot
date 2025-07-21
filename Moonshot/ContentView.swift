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
    
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
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
