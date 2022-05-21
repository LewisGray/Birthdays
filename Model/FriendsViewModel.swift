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
        let newFriend = Friend(Name: Name, DateOfBirth: DateOfBirth, BitAboutThem: BitAboutThem, isPrepared: false)
        friends.append(newFriend)
        return newFriend
    }
    
    func preparedForFriend(friend:Friend)
    {
        if let index = friends.firstIndex(where: {(existingFriend) -> Bool in
            return existingFriend.id==friend.id
            
        }){
            //Run this
            friends[index] = friend.prepared()
        }
        
    }
    
    //Update Function
    
    func saveFriendList(){
        if let encodedData = try? JSONEncoder().encode(friends){
            UserDefaults.standard.set(encodedData, forKey: key )
        }
    }
    
}
