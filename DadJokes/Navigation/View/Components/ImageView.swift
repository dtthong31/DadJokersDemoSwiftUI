//
//  ImageView.swift
//  DadJokes
//
//  Created by dtthong on 01/08/2022.
//

import SwiftUI

struct ImageView: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url), content: { image in
                                image.resizable()
                            }, placeholder: {ProgressView()}).frame(width: 300, height: 300).clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "aaaaa")
    }
}
