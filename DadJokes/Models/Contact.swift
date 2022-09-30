//
//  State.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import Foundation

struct Contact: Decodable, Hashable, Encodable {
    var id : String?
    var name: String
    var emoji: String
    var avatar: String
}
