//
//  HomeView.swift
//  DadJokes
//
//  Created by dtthong on 27/07/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var modelView = StateViewModel()
    var body: some View {
        NavigationView {
            List(modelView.listContact, id: \.self) { model in
                NavigationLink(destination:ImageView(url: model.emoji)) {
                    AsyncImage(url: URL(string: model.avatar), content: { image in
                                            image.resizable()
                                        }, placeholder: {ProgressView()}).frame(width: 30, height: 30).clipShape(Circle())
                    Text(model.name)
                    
                }
            }
            .navigationTitle("Animal")
            .refreshable {
                modelView.getData()
            }
//            .onAppear(){
//                self.modelView.listContact
//            }
        }.navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
