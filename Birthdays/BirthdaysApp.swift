//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Lewis Gray on 17/05/2022.
//

import SwiftUI

@main
struct BirthdaysApp: App {
    
    @StateObject var friendsViewModel: FriendsViewModel = FriendsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(friendsViewModel)
        }
    }
}
