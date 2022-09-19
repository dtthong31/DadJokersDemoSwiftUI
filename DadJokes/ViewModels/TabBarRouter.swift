//
//  TabBarRouter.swift
//  DadJokes
//
//  Created by dtthong on 29/07/2022.
//

import Foundation

class TabBarRouter: ObservableObject {
    @Published var currentPage :Page = .home
}

enum Page {
    case home
    case map
    case plus
    case records
    case account
}
