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
    @StateObject var viewRouter = TabBarRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
