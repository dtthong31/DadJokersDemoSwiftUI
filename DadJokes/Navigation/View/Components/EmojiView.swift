//
//  EmojiView.swift
//  DadJokes
//
//  Created by dtthong on 26/07/2022.
//

import SwiftUI

struct EmojiView: View {
    var rating: String
    var body: some View {
        switch rating{
        case "Tym" :
            return Text("🥰")
        case "Sad" :
            return Text("😔")
        default:
            return Text("😎")
        }
    }
    init(rating: String) {
        self.rating = rating
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(rating: "Sad")
    }
}
