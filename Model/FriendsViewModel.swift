//
//  FriendsViewModel.swift
//  Birthdays
//
//  Created by Lewis Gray on 20/05/2022.
//

import Foundation
import UIKit

class FriendsViewModel: ObservableObject{
    let key: String = "friend_list"
    @Published var friends: [Friend] = [] {
        didSet{
            saveFriendList()
        }
    }
    
    init(){
        getFriends()
    }
    func getFriends(){
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedFriends = try? JSONDecoder().decode([Friend].self, from: data)
         else {return}
        
        self.friends = savedFriends

    }
    
    func delete(indexSet:IndexSet){
        friends.remove(atOffsets: indexSet)
    }
    func move(from: IndexSet, to:Int){
        friends.move(fromOffsets: from, toOffset: to)
    }
    
    func addFriend(Name: String, DateOfBirth: Date, BitAboutThem: String)-> Friend{
        let newFriend = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, Age: calcAge(birthday: DateOfBirth))
        friends.append(newFriend)
        return newFriend
    }
    
    func editFriend(friend:Friend, Name: String, DateOfBirth: Date, BitAboutThem: String)-> Friend
    {
        if let index = friends.firstIndex(where: {(existingFriend) -> Bool in
            return existingFriend.id==friend.id
            
        }){
            //Run this
            friends[index] = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, Age: calcAge(birthday: DateOfBirth))
            return friends[index]
                    }
        //This should never happen
        return friends[0]
    }
    
    //Update Function
    func saveFriendList(){
        if let encodedData = try? JSONEncoder().encode(friends){
            UserDefaults.standard.set(encodedData, forKey: key )
        }
    }
    
    
    func calcAge(birthday: Date) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = birthday
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
}
