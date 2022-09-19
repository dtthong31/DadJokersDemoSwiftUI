//
//  CardDetailView.swift
//  DadJokes
//
//  Created by dtthong on 27/07/2022.
//

import SwiftUI

struct CardDetailView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                NavigationLink(destination: EmojiView(rating: "Sad")) {
                                    CardView()
                                }
                            }
                        }
                    }.navigationTitle("Records")
                }
            }
        }
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0){
            Image("Image2")
            Text("SwiftUI for iOS 15")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("A complete guide to designing for iOS 14 with video, example and design files").opacity(0.7).foregroundColor(.white)
            Text("20 sections and 3 hours").opacity(0.7).foregroundColor(.white)
            
        }.padding(16)
            .background(LinearGradient(gradient: Gradient(stops: [
                .init(color: Color("AccentColor"), location: 0),
                .init(color: Color("Color2"), location: 1)
            ]), startPoint: UnitPoint(x:0.500, y: 4.08e-7), endPoint: UnitPoint(x: -0.01, y: 0.977)))
            .cornerRadius(20.0)
            .frame(width:252, height:329)
            .cornerRadius(30.0)
    }
}
