//
//  SwiftUIView.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import SwiftUI

struct TabBarIcon: View {
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: model.emoji)
        }
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIcon()
    }
}
