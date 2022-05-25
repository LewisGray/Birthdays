//
//  Notifications.swift
//  Birthdays
//
//  Created by Lewis Gray on 24/05/2022.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func getPermission(){
        let options: UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options){ (success, error) in
            if let error = error{
                print("ERROR:\(error)")
            }
            else{
                print("GREAT SUCCESS")
            }
        }
    }
    func scheduleBirthdayNotification(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "🎈 Happy Birthday \(friend.Name)! 🎈"
        data.body = " 🙋 Don't forget to contact them! 🙋"
        data.sound = .default
        data.badge = 1
        //For testing
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let month = Calendar.current.dateComponents([.month], from: friend.DateOfBirth).month
        let day = Calendar.current.dateComponents([.day], from: friend.DateOfBirth).day

        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.month = month
        dateComponents.day = day

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func scheduleMonthlyNotification(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "There's one month to go! 😁"
        data.body = "Until \(friend.Name)'s birthday 🎉\nDon't forget to prepare!"
        data.sound = .default
        data.badge = 1
        //For testing
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // Subtracting
        let monthSubtractedDate = addOrSubtractMonth(month:-1,date:friend.DateOfBirth)
        
        let month = Calendar.current.dateComponents([.month], from: monthSubtractedDate).month
        let day = Calendar.current.dateComponents([.day], from: monthSubtractedDate).day

        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.month = month
        dateComponents.day = day
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func scheduleFortnightlyNotification(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "2 weeks until \(friend.Name)'s birthday!"
        data.body = "There's still plenty of time...!"
        data.sound = .default
        data.badge = 1
        //For testing
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Subtracting
        let monthSubtractedDate = addOrSubtractWeek(days:-14,date:friend.DateOfBirth)
        let month = Calendar.current.dateComponents([.month], from: monthSubtractedDate).month
        let day = Calendar.current.dateComponents([.day], from: monthSubtractedDate).day

        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.month = month
        dateComponents.day = day

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func scheduleWeeklyNotification(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "One week till \(friend.Name)'s big day!"
        data.body = "Blink and you'll be there 😆"
        data.sound = .default
        data.badge = 1
        //For testing
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // Subtracting
        let monthSubtractedDate = addOrSubtractWeek(days:-7,date:friend.DateOfBirth)
        let month = Calendar.current.dateComponents([.month], from: monthSubtractedDate).month
        let day = Calendar.current.dateComponents([.day], from: monthSubtractedDate).day

        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.month = month
        dateComponents.day = day

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    
    //Allows the user to send push notifications to view them

    func test1(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "🎈 Happy Birthday \(friend.Name)! 🎈"
        data.body = " 🙋 Don't forget to contact them! 🙋"
        data.sound = .default
        data.badge = 1
        //For testing
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
       
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func test2(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "There's one month to go! 😁"
        data.body = "Until \(friend.Name)'s birthday 🎉\nDon't forget to prepare!"
        data.sound = .default
        data.badge = 1
        //For testing
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func test3(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "2 weeks until \(friend.Name)'s birthday!"
        data.body = "There's still plenty of time...!"
        data.sound = .default
        data.badge = 1
        //For testing
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        

        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    func test4(friend: Friend){
        let data = UNMutableNotificationContent()
        data.title = "One week till \(friend.Name)'s big day!"
        data.body = "Blink and you'll be there 😆"
        data.sound = .default
        data.badge = 1
        //For testing
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: data, trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    
    
    
    
    
    
    
    
    func addOrSubtractMonth(month: Int,date: Date) -> Date {
        return Calendar.current.date(byAdding: .month, value: month, to: date)!
    }
    
    func addOrSubtractWeek(days: Int,date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: date)!
    }
}


struct Notifications: View {
    @EnvironmentObject var birthdayPlanViewModel: BirthdayPlanViewModel
    
    var body: some View {
        let friend = birthdayPlanViewModel.plans[0].BirthdayPerson
        VStack{
        Button("Request Permission"){
            NotificationManager.instance.getPermission()
            
        }
        Button("Birthday Notification"){
            NotificationManager.instance.test1(friend:friend)
            
        }
        Button("Monthly Notification"){
            NotificationManager.instance.test2(friend:friend)
            
        }
        Button("Fortnightly Notification"){
            NotificationManager.instance.test3(friend:friend)
            
        }
        Button("Weekly Notification"){
            NotificationManager.instance.test4(friend:friend)
            
        }
        }
        .onAppear(){
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
    
    
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
