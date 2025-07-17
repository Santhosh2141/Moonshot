//
//  ScrollView.swift
//  Moonshot
//
//  Created by Santhosh Srinivas on 14/07/25.
//

import SwiftUI

struct ScrollView1: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
//    fit in as many columns as possible, as long as they are at least 80 points in width
    let layout1 = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
                ScrollView{
                    ScrollView(.horizontal){
                        LazyHStack(spacing: 10){
                            ForEach(0..<15){
                                CustomText(text: "Item \($0)")
                            }
                        }
                        .padding(10)
                    }
                    LazyVStack(spacing: 10) {
                        // what LazyVStack does is, it builds the item on the go and not all at once. so as we scroll only the other items are created
        
//                        Image(systemName: "globe")
//                            .imageScale(.large)
//                            .foregroundColor(.accentColor)
//                        Text("Hello, world!")
//                        Image("Example")
//                            .resizable()
//                            .scaledToFit()
            //                .containerRelativeFrame(.horizontal) { size, axis in
            //                        size * 0.8
            //                    }
                        // THIS IS FOR ios 17+
//                            .frame(width: 300, height: 300)
//                            .clipped()
                        ScrollView{
                            LazyVGrid(columns: layout){
                                ForEach(0..<20){
                                    Text("Value \($0)")
                                }
                            }
                        }
                        
                        ScrollView{
                            LazyVGrid(columns: layout1){
                                ForEach(0..<20){
                                    Text("Value \($0)")
                                }
                            }
                        }
                        
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: layout) {
                                ForEach(0..<1000) {
                                    Text("Item \($0)")
                                }
                            }
                        }
                        
                        ForEach(0..<100){
                            CustomText(text: "Item \($0)")
                                .font(.title)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView1()
    }
}
