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
    @StateObject var birthdayPlanViewModel: BirthdayPlanViewModel = BirthdayPlanViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(friendsViewModel)
                .environmentObject(birthdayPlanViewModel)
        }
    }
}
//https://www.andrewcbancroft.com/2016/05/26/swift-cheat-sheet-for-dates-formatters-date-components/
