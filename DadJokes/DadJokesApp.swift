//
//  DadJokesApp.swift
//  DadJokes
//
//  Created by dtthong on 26/07/2022.
//

import SwiftUI

@main
struct DadJokesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
